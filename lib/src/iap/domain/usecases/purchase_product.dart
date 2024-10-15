import 'package:flutter_iap_module/src/iap/domain/entities/product.dart';
import 'package:flutter_iap_module/src/iap/domain/repositories/iap_repository.dart';

class PurchaseProduct {
  final IAPRepository repository;

  PurchaseProduct(this.repository);

  Future<void> execute(Product product) async {
    return await repository.purchaseProduct(product);
  }
}