import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/models/station.dart';
import 'package:mosmetro_wear/view/widgets/line/line_point.dart';

class StationWidget extends StatelessWidget {
  const StationWidget({
    required this.station,
    required this.routePoint,
    required this.color,
    super.key,
  });

  final Station station;
  final PointType routePoint;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            LinePoint(
              routePoint: routePoint,
              color: color,
              number: station.line,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                station.name,
                style: const TextStyle(fontSize: 23, height: 1, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
