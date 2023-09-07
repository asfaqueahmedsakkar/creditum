import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;

  const Logo({super.key, this.size = 200});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      child: Image.asset(
        "assets/logo/credium.png",
        height: size,
      ),
    );
  }
}
