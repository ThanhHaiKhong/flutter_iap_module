import 'package:flutter_iap_module/src/iap/domain/entities/product.dart';
import 'package:flutter_iap_module/src/iap/domain/repositories/iap_repository.dart';
import 'package:flutter_iap_module/src/iap/domain/usecases/purchase_product.dart';
import 'package:flutter_iap_module/src/iap/domain/usecases/restore_purchases.dart';
import 'package:get/get.dart';

class IAPController extends GetxController {
  final PurchaseProduct purchaseProductUseCase;
  final RestorePurchases restorePurchasesUseCase;

  var products = <Product>[].obs;
  var isLoading = false.obs;
  var isPurchasing = false.obs;
  var purchaseMessage = ''.obs;
  var transactionResult = TransactionResult.none.obs;

  IAPController({
    required this.purchaseProductUseCase,
    required this.restorePurchasesUseCase,
  });

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    isLoading(true);
    products.value = await Get.find<IAPRepository>().getProducts();
    isLoading(false);
  }

  Future<void> purchaseProduct(Product product) async {
    isPurchasing.value = true;
    purchaseMessage.value = ''; 
  
    await Future.delayed(const Duration(seconds: 2));
    
    bool success = (DateTime.now().millisecondsSinceEpoch % 2 == 0);
    if (success) {
      await purchaseProductUseCase.execute(product);
      purchaseMessage.value = 'Purchase successful: ${product.title}';
      transactionResult.value = TransactionResult.success;
    } else {
      purchaseMessage.value = 'Purchase failed: ${product.title}';
      transactionResult.value = TransactionResult.failed;
    }

    isPurchasing.value = false; 
  }

  Future<void> restorePurchases() async {
    await restorePurchasesUseCase.execute();
  }

  // Selected product (Reactive variable)
  Rx<Product> selectedProduct = Product.monthly.obs;

  void navigateToTerms() {
    // Handle navigation to terms
  }

  void navigateToPrivacy() {
    // Handle navigation to privacy
  }

  void resetTransactionResult() {
    transactionResult.value = TransactionResult.none;
  }

  // Method to update selected product
  void updateSelectedProduct(Product product) {
    if (selectedProduct.value == product) {
      return;
    }
    selectedProduct.value = product;
  }

  // Method to update products (optional if you need to change product list)
  void updateProducts(List<Product> newProducts) {
    products.assignAll(newProducts);
  }
}

enum TransactionResult {
  none,
  success,
  failed,
}