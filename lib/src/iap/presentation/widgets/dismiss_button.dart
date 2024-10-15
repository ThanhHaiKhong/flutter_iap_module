import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DismissButton extends StatelessWidget {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  const DismissButton({super.key, this.left, this.top, this.right, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: IconButton(
        icon: const Icon(
          CupertinoIcons.xmark_circle_fill, 
          size: 26, 
          color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}