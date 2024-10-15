import 'package:flutter_iap_module/src/iap/domain/repositories/iap_repository.dart';

class RestorePurchases {
  final IAPRepository repository;

  RestorePurchases(this.repository);

  Future<void> execute() async {
    return await repository.restorePurchases();
  }
}