// Mocks generated by Mockito 5.0.14 from annotations
// in pylons_wallet/test/mocks/mock_wallet_store.dart.
// Do not manually edit this file.

import 'package:mockito/mockito.dart' as _i1;
import 'package:transaction_signing_gateway/model/wallet_public_info.dart'
as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeWalletPublicInfo_0 extends _i1.Fake implements _i2.WalletPublicInfo {
}

/// A class which mocks [WalletPublicInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockWalletPublicInfo extends _i1.Mock implements _i2.WalletPublicInfo {
  MockWalletPublicInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get name =>
      (super.noSuchMethod(Invocation.getter(#name), returnValue: '') as String);
  @override
  String get publicAddress =>
      (super.noSuchMethod(Invocation.getter(#publicAddress), returnValue: '')
      as String);
  @override
  String get walletId =>
      (super.noSuchMethod(Invocation.getter(#walletId), returnValue: '')
      as String);
  @override
  String get chainId =>
      (super.noSuchMethod(Invocation.getter(#chainId), returnValue: '')
      as String);
  @override
  List<Object?> get props =>
      (super.noSuchMethod(Invocation.getter(#props), returnValue: <Object?>[])
      as List<Object?>);
  @override
  _i2.WalletPublicInfo copyWith(
      {String? name,
        String? publicAddress,
        String? walletId,
        String? chainId,
        String? additionalData}) =>
      (super.noSuchMethod(
          Invocation.method(#copyWith, [], {
            #name: name,
            #publicAddress: publicAddress,
            #walletId: walletId,
            #chainId: chainId,
            #additionalData: additionalData
          }),
          returnValue: _FakeWalletPublicInfo_0()) as _i2.WalletPublicInfo);
  @override
  String toString() => super.toString();
}
