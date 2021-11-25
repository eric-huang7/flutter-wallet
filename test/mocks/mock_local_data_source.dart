import 'package:pylons_wallet/utils/third_party_services/local_storage_service.dart';

class MockLocalDataSource extends LocalDataSource {
  @override
  String StripeToken = '';
  @override
  bool StripeAccountRegistered = false;
  @override
  String StripeAccount = '';

  @override
  Future<void> loadData() async {
  }

  @override
  Future<void> saveData() async {
  }

}