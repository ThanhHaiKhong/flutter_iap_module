
import 'package:flutter/material.dart';

class BenefitItemView extends StatelessWidget {
  final String title;

  const BenefitItemView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.verified_rounded, color: Colors.cyan),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}