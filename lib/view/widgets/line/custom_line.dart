import 'package:flutter/material.dart';

class CustomLine extends CustomPainter {
  final double lineRatio;
  final Color color;

  const CustomLine({
    required this.lineRatio,
    required this.color,
  });

  @override
  // It's still readable.
  // ignore: long-method
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.lightBlue
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    if (lineRatio == 0) {
      canvas.drawLine(
        const Offset(20, 55),
        Offset(20, size.height - 40),
        linePaint,
      );
    } else {
      canvas
        ..drawLine(
          const Offset(20, 55),
          Offset(20, size.height * lineRatio - 15),
          linePaint,
        )
        ..drawLine(
          Offset(20, size.height * lineRatio + 15),
          Offset(20, size.height - 40),
          linePaint,
        )
        ..drawCircle(
          Offset(20, size.height * lineRatio),
          4,
          linePaint,
        );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
