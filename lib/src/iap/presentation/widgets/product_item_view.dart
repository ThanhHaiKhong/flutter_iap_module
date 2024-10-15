import 'package:flutter/material.dart';
import 'package:flutter_iap_module/src/iap/domain/entities/product.dart';
import 'package:flutter_iap_module/src/iap/presentation/controllers/iap_controller.dart';
import 'package:get/get.dart';

class ProductItemView extends StatelessWidget {
  final Product product;

  const ProductItemView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final IAPController controller = Get.find<IAPController>();
    return GestureDetector(
      onTap: () {
        controller.updateSelectedProduct(product);
      },
      child: Obx(() {
        final isSelected = controller.selectedProduct.value.id == product.id;
        return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 0),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                  color: isSelected ? Colors.cyan : Colors.grey, width: 1),
            ),
            height: 50,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Icon(
                    isSelected
                        ? Icons.check_circle_rounded
                        : Icons.circle_outlined,
                    color: isSelected ? Colors.cyan : Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${product.price} ${product.currencyCode}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    product.title,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
