
import 'package:flutter_iap_module/src/iap/data/models/product_model.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class IAPDataSource {
  final InAppPurchase _iap = InAppPurchase.instance;

  Future<List<ProductModel>> fetchProducts(List<String> ids) async {
    final ProductDetailsResponse response =
        await _iap.queryProductDetails(ids.toSet());
    if (response.notFoundIDs.isNotEmpty) {
      return [];
    }
    return response.productDetails.map((productDetails) {
      return ProductModel(
        id: productDetails.id,
        title: productDetails.title,
        description: productDetails.description,
        price: productDetails.price,
        rawPrice: productDetails.rawPrice,
        currencyCode: productDetails.currencyCode,
      );
    }).toList();
  }

  Future<void> purchaseProduct(ProductModel product) async {
    final ProductDetails productDetails = ProductDetails(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price,
      rawPrice: product.rawPrice,
      currencyCode: product.currencyCode,
    );
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
    _iap.buyConsumable(purchaseParam: purchaseParam);
  }

  Future<void> restorePurchases() async {
    await _iap.restorePurchases();
  }
}
