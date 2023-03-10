import 'dart:convert';
import 'dart:typed_data';

import 'package:alan/wallet/network_info.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:pylons_wallet/stores/models/transaction_response.dart';
import 'package:pylons_wallet/utils/custom_transaction_broadcaster/custom_transaction_broadcaster.dart';
import 'package:transaction_signing_gateway/alan/alan_wallet_derivator.dart';

import 'package:transaction_signing_gateway/mobile/no_op_transaction_summary_ui.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/transaction_broadcasting_failure.dart';
import 'package:transaction_signing_gateway/model/transaction_hash.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_info.dart';
import 'package:transaction_signing_gateway/model/wallet_lookup_key.dart';
import 'package:transaction_signing_gateway/transaction_broadcaster.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';
import 'package:transaction_signing_gateway/transaction_summary_ui.dart';
import 'package:transaction_signing_gateway/wallet_derivator.dart';


class CustomTransactionSigningGateway {
  final List<TransactionSigner> _signers;
  final List<CustomTransactionBroadcaster> _broadcasters;
  final List<WalletDerivator> _derivators;
  final KeyInfoStorage _infoStorage;
  final TransactionSummaryUI _transactionSummaryUI;

  CustomTransactionSigningGateway({
    List<TransactionSigner>? signers,
    List<CustomTransactionBroadcaster>? broadcasters,
    KeyInfoStorage? infoStorage,
    TransactionSummaryUI? transactionSummaryUI,
    List<WalletDerivator>? derivators,
  })  : _signers = List.unmodifiable(signers ?? []),
        _broadcasters = List.unmodifiable(broadcasters ?? []),
        _derivators = List.unmodifiable(derivators ?? [AlanWalletDerivator()]),
        _infoStorage = infoStorage ??  CosmosKeyInfoStorage(
          serializers: [AlanCredentialsSerializer()],
          plainDataStore: SharedPrefsPlainDataStore(),
          secureDataStore: FlutterSecureStorageDataStore(),
        ),
        _transactionSummaryUI = transactionSummaryUI ?? NoOpTransactionSummaryUI();

  /// Stores the passed-in wallet credentials securely on the device.
  ///
  /// The `secure_storage` package and strong encryption are used internally,  where [password] is used to generate the
  /// encryption key. Password IS NOT STORED but is passed every time in order to access the private credentials.
  /// [WalletPublicInfo], part of the [PrivateWalletCredentials], is accessible without a password.
  Future<Either<CredentialsStorageFailure, Unit>> storeWalletCredentials({
    required PrivateWalletCredentials credentials,
    required String password,
  }) =>
      _infoStorage.savePrivateCredentials(
        walletCredentials: credentials,
        password: password,
      );

  /// Signs the passed [transaction].
  ///
  /// This function triggers the entire signing flow, where a transaction summary is first shown to the user.
  /// If the transaction is accepted, the workflow looks for a capable [TransactionSigner].
  /// After a credentials retrieval and transaction signing is successful, a [SignedTransaction] object is output.
  /// If any of the steps fail, a [TransactionSigningFailure] is returned.
  Future<Either<TransactionSigningFailure, SignedTransaction>> signTransaction({
    required UnsignedTransaction transaction,
    required WalletLookupKey walletLookupKey,
  }) async =>
      _transactionSummaryUI
          .showTransactionSummaryUI(transaction: transaction)
          .flatMap(
            (userAccepted) => _infoStorage
            .getPrivateCredentials(walletLookupKey)
            .leftMap((err) => left(StorageProblemSigningFailure(err))),
      )
          .flatMap(
            (privateCreds) async => _findCapableSigner(transaction).sign(
          privateCredentials: privateCreds,
          transaction: transaction,
        ),
      );
  
  Future<String> signPureMessage({
    required NetworkInfo networkInfo,
    required WalletLookupKey walletLookupKey,
    required String msg
  }) async {
    final retCreds = await _infoStorage
        .getPrivateCredentials(walletLookupKey);
    if(retCreds.isRight()){
      final creds = retCreds.toOption().toNullable();
      if(creds != null){
        final wallet =(creds as AlanPrivateWalletCredentials).alanWallet(networkInfo);
        List<int> list = utf8.encode(msg);
        Uint8List bytes = Uint8List.fromList(list);
        final signedMsg = wallet.sign(bytes);
        return base64Encode(signedMsg);
      }
    }
    return "";
  }

  Future<Either<TransactionBroadcastingFailure, TransactionResponse>> broadcastTransaction({
    required WalletLookupKey walletLookupKey,
    required SignedTransaction transaction,
  }) async =>
      _infoStorage
          .getPrivateCredentials(walletLookupKey)
          .leftMap<TransactionBroadcastingFailure>((err) => left(StorageProblemBroadcastingFailure()))
          .flatMap(
            (privateCreds) async => _findCapableBroadcaster(transaction).broadcast(
          transaction: transaction,
          privateWalletCredentials: privateCreds,
        ),
      );

  Future<Either<WalletDerivationFailure, PrivateWalletCredentials>> deriveWallet({
    required WalletDerivationInfo walletDerivationInfo,
  }) async =>
      _findCapableDerivator(walletDerivationInfo).derive(walletDerivationInfo: walletDerivationInfo);

  Future<Either<CredentialsStorageFailure, List<WalletPublicInfo>>> getWalletsList() => _infoStorage .getWalletsList();

  /// Verifies if passed lookupKey is pointing to a valid wallet stored within the secure storage.
  Future<Either<TransactionSigningFailure, bool>> verifyLookupKey(WalletLookupKey walletLookupKey) =>
      _infoStorage.verifyLookupKey(walletLookupKey);

  TransactionSigner _findCapableSigner(UnsignedTransaction transaction) => _signers.firstWhere(
        (element) => element.canSign(transaction),
    orElse: () => NotFoundTransactionSigner(),
  );

  CustomTransactionBroadcaster _findCapableBroadcaster(SignedTransaction transaction) => _broadcasters.firstWhere(
        (element) => element.canBroadcast(transaction),
    orElse: () => CustomNotFoundBroadcaster(),
  );

  WalletDerivator _findCapableDerivator(WalletDerivationInfo walletDerivationInfo) => _derivators.firstWhere(
        (element) => element.canDerive(walletDerivationInfo),
    orElse: () => NotFoundDerivator(),
  );
}
