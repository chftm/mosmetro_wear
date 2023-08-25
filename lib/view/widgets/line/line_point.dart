import 'package:flutter/material.dart';
import 'package:mosmetro_wear/view/widgets/line/station_widget.dart';

enum PointType { number, fill, outline }

class LinePoint extends StatelessWidget {
  const LinePoint({
    required this.routePoint,
    required this.color,
    this.number = 0,
    super.key,
  });

  final PointType routePoint;
  final Color color;
  final int number;

  @override
  Widget build(BuildContext context) {
    Widget pointWidget;

    switch (routePoint) {
      case PointType.number:
        pointWidget = Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          width: 32,
          height: 32,
          child: Text(
            number.toString(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,

          ),
        );
      case PointType.fill:
        pointWidget = Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          width: 32,
          height: 32,
        );
      case PointType.outline:
        pointWidget = Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border.fromBorderSide(
              BorderSide(
                color: color,
                width: 7,
              ),
            ),
            shape: BoxShape.circle,
          ),
          width: 32,
          height: 32,
        );
    }

    return pointWidget;
  }
}
