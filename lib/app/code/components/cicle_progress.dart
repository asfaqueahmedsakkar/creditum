import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends StatelessWidget {
  final int progress;

  const CircleProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CircleProgressPainter(progress: progress),
      child: Center(
        child: Text(
          "$progress%",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _CircleProgressPainter extends CustomPainter {
  final int progress;

  _CircleProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    var radius = min(size.width, size.height) / 2;
    double stockWidth = 10;
    canvas.drawCircle(
        Offset(radius, radius),
        radius,
        Paint()
          ..color = Colors.grey[200]!
          ..style = PaintingStyle.stroke
          ..strokeWidth = stockWidth);

    canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        -pi / 2,
        (progress == 100 ? progress : progress * 0.95).clamp(1, 100) /
            100 *
            2 *
            pi,
        false,
        Paint()
          ..color = Colors.green
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = stockWidth);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return progress != (oldDelegate as _CircleProgressPainter).progress;
  }
}
