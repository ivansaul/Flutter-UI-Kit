// Generated using https://shapemaker.web.app/

import 'package:flutter/material.dart';

class HeaderAppbar extends StatelessWidget {
  const HeaderAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return CustomPaint(
      size: Size(
        width,
        width * 1.8,
      ),
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height * -0.0023697);
    path.lineTo(size.width * -0.0076923, size.height * 0.3554502);
    path.quadraticBezierTo(size.width * 0.3730769, size.height * 0.4010664,
        size.width * 0.5820513, size.height * 0.4241706);
    path.cubicTo(size.width * 0.7179487, size.height * 0.4401659, size.width * 0.7724359,
        size.height * 0.4289100, size.width * 0.8282051, size.height * 0.4111374);
    path.quadraticBezierTo(size.width * 0.9217949, size.height * 0.3847749,
        size.width * 1.0025641, size.height * 0.3578199);
    path.lineTo(size.width * 0.9974359, 0);
    path.lineTo(size.width, size.height * -0.0011848);
    path.lineTo(0, size.height * -0.0023697);
    path.close();

    // Stroke

    Paint paintStroke = Paint()
      ..color = Colors.grey.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, paintStroke);

    // Fill

    Paint paintFill = Paint()
      ..color = const Color(0xffC45CF2)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
