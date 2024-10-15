import 'package:flutter_iap_module/src/iap/domain/entities/product.dart';

abstract class IAPRepository {
  Future<List<Product>> getProducts();
  Future<void> purchaseProduct(Product product);
  Future<void> restorePurchases();
}