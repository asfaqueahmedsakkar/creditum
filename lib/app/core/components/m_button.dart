import 'package:creditum/app/core/components/my_card.dart';
import 'package:flutter/material.dart';

class MButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? color;

  const MButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: MyCard(
        padding: EdgeInsets.zero,
        color: color,
        child: RawMaterialButton(
          splashColor: Color.lerp(Colors.white, color, 0.7),
          onPressed: onTap,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
