import 'package:flutter/material.dart';

class TitleBalance extends StatelessWidget {
  final String title;
  final String balance;
  final Widget? icon;

  final double? balanceFontSize;

  final Color? titleColor;

  final Color? balanceColor;

  const TitleBalance({
    super.key,
    required this.title,
    required this.balance,
    this.icon, this.balanceFontSize, this.titleColor, this.balanceColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            Text(
              title,
              style:   TextStyle(
                color: titleColor??Colors.black,
              ),
            ),
            if (icon != null) Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SizedBox(height:16,child: icon!),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          balance,
          style:  TextStyle(
            fontSize: balanceFontSize??24,
            fontWeight: FontWeight.w700,
            color: (balanceColor??Colors.black).withOpacity(0.9),
          ),
        )
      ],
    );
  }
}
