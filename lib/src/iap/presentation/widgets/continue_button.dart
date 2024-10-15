import 'package:flutter/material.dart';
import 'package:flutter_iap_module/src/iap/presentation/controllers/iap_controller.dart';
import 'package:get/get.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<IAPController>();
    return Obx(() {
      final isPurchasing = controller.isPurchasing.value;
      return AnimatedContainer(
        duration: const Duration(microseconds: 300),
        height: 50,
        child: FilledButton(
          onPressed: () {
            if (isPurchasing) return;
            final selectedProduct = controller.selectedProduct.value;
            controller.purchaseProduct(selectedProduct);
          },
          style: iapButtonStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: isPurchasing
                ? [
                    const SizedBox(width: 8),
                    const Text('Processing...'),
                    const SizedBox(width: 8),
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ]
                : [
                    const Text('Continue'),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_rounded, size: 24),
                  ],
          ),
        ),
      );
    });
  }
}

final ButtonStyle iapButtonStyle = FilledButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.cyan,
  padding: const EdgeInsets.symmetric(vertical: 14),
  textStyle: iapButtonTextStyle,
);

const TextStyle iapButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
