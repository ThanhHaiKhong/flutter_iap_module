import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class MockIAPDataSource {
  final List<ProductModel> _mockProducts = [
    const ProductModel(
      id: 'monthly_subscription',
      title: 'Monthly Subscription',
      description: 'Access to premium features for a month',
      price: '\$4.99',
      rawPrice: 4.99,
      currencyCode: 'USD',
    ),
    const ProductModel(
      id: 'yearly_subscription',
      title: 'Yearly Subscription',
      description: 'Access to premium features for a year',
      price: '\$49.99',
      rawPrice: 49.99,
      currencyCode: 'USD',
    ),
  ];

  Future<List<ProductModel>> fetchProducts(List<String> ids) async {
    await Future.delayed(const Duration(seconds: 1)); 
    return _mockProducts;
  }

  Future<void> purchaseProduct(ProductModel product) async {
    await Future.delayed(const Duration(seconds: 1));
    if (kDebugMode) {
      print('Purchased: ${product.title}');
    }
  }

  Future<void> restorePurchases() async {
    await Future.delayed(const Duration(seconds: 1));
    if (kDebugMode) {
      print('Restored purchases');
    }
  }
}
