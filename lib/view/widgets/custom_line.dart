import 'package:flutter/material.dart';

class CustomLine extends CustomPainter {
  const CustomLine({required this.lineRatio});

  final double lineRatio;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.lightBlue
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas
      ..drawLine(
        Offset(20, 20),
        Offset(20, size.height * lineRatio - 15),
        linePaint,
      )
      ..drawLine(
        Offset(20, size.height * lineRatio + 15),
        Offset(20, size.height - 20),
        linePaint,
      )
      ..drawCircle(
        Offset(20, size.height * lineRatio),
        4.0,
        linePaint,
      );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
