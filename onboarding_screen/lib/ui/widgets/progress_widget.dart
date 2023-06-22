import 'dart:math';

import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final double progress;
  const ProgressWidget({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58,
      height: 58,
      child: CustomPaint(painter: _ProgressPainter(progress)),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final double progress;

  _ProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paintOut = Paint()
      ..color = Colors.white
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final paintIn = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = size.width * 0.5;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi,
      false,
      paintIn,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      (progress * 2 * pi) / 100,
      false,
      paintOut,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
