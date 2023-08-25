import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/lines.dart';
import 'package:mosmetro_wear/data/models/station.dart';
import 'package:mosmetro_wear/view/widgets/line/line_point.dart';

class StationWidget extends StatelessWidget {
  const StationWidget({
    required this.station,
    required this.routePoint,
    super.key,
  });

  final Station station;
  final PointType routePoint;

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
              color: Lines.lineColors[station.line]!,
              number: station.line,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                station.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
