import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color? color;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Widget child;
  final BoxShape? shape;
  final Color? shadowColor;

  const MyCard(
      {super.key,
      this.color,
      this.borderRadius,
      this.padding,
      required this.child,
      this.shape,
      this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: shape == BoxShape.circle
            ? null
            : BorderRadius.circular(
                borderRadius ?? 8,
              ),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.black.withOpacity(0.1),
            blurRadius: 4,
          )
        ],
      ),
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
      child: child,
    );
  }
}
