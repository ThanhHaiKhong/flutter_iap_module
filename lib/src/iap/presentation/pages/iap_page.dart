import 'package:flutter/material.dart';
import 'package:flutter_iap_module/src/iap/presentation/controllers/iap_controller.dart';
import 'package:flutter_iap_module/src/iap/presentation/widgets/action_button.dart';
import 'package:flutter_iap_module/src/iap/presentation/widgets/benefit_item_view.dart';
import 'package:flutter_iap_module/src/iap/presentation/widgets/continue_button.dart';
import 'package:flutter_iap_module/src/iap/presentation/widgets/dismiss_button.dart';
import 'package:flutter_iap_module/src/iap/presentation/widgets/product_item_view.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class IAPPage extends GetView<IAPController> {
  const IAPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<IAPController>(),
      tag: const Uuid().v4(),
      builder: (controller) {
        return Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            _backgroundSection(),
            _mainContent(),
            const DismissButton(top: 44, right: 12),
          ],
        );
      },
    );
  }
}

extension IapView on IAPPage {
  Widget _backgroundSection() {
    return Positioned(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                'assets/images/gif_inapp_1.gif',
                fit: BoxFit.fill,
              ),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyan.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 25,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  border: Border.all(color: Colors.cyan, width: 4),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.5),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/app_icon.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 10,
                    blurRadius: 30,
                    offset: Offset(0, -20),
                  ),
                ],
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _mainContent() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Expanded(
          child: _bodySection(),
        ),
      ),
    );
  }

  Widget _bodySection() {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 30,
      runAlignment: WrapAlignment.center,
      children: [
        _titleSection(),
        _benefitsSection(),
        _productsSection(),
        _continueButton(),
        _resorePrivacyAndTermSection(),
      ],
    );
  }

  Widget _titleSection() {
    return const Column(
      children: [
        Text(
          'AI Mate',
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          'Unlock all features',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _benefitsSection() {
    return const Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        BenefitItemView(title: 'Unlimited access to all features'),
        BenefitItemView(title: 'Biggest collection of AI models'),
        BenefitItemView(title: 'High quality AI models'),
      ],
    );
  }

  Widget _productsSection() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        for (final product in controller.products)
          ProductItemView(product: product),
      ],
    );
  }

  Widget _continueButton() {
    return const ContinueButton();
  }

  Widget _resorePrivacyAndTermSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(
          title: 'Restore',
          onPressed: controller.restorePurchases,
        ),
        ActionButton(
          title: 'Term',
          onPressed: controller.navigateToTerms,
        ),
        ActionButton(
          title: 'Privacy',
          onPressed: controller.navigateToPrivacy,
        ),
      ],
    );
  }
}
