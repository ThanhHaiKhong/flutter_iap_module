
import 'package:flutter_iap_module/src/iap/data/datasources/mock_iap_data_source.dart';
import 'package:flutter_iap_module/src/iap/data/models/product_model.dart';
import 'package:flutter_iap_module/src/iap/domain/entities/product.dart';
import 'package:flutter_iap_module/src/iap/domain/repositories/iap_repository.dart';

class IAPRepositoryImpl implements IAPRepository {
  final MockIAPDataSource dataSource ;

  IAPRepositoryImpl({required this.dataSource});

  @override
  Future<List<Product>> getProducts() async {
    final List<ProductModel> productModels = await dataSource.fetchProducts(['monthly_subscription', 'yearly_subscription']);
    return productModels;
  }

  @override
  Future<void> purchaseProduct(Product product) async {
    await dataSource.purchaseProduct(ProductModel(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price,
      rawPrice: product.rawPrice,
      currencyCode: product.currencyCode,
    ));
  }

  @override
  Future<void> restorePurchases() async {
    return await dataSource.restorePurchases();
  }
}