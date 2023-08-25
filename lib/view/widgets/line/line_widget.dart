import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/lines.dart';
import 'package:mosmetro_wear/data/models/station.dart';
import 'package:mosmetro_wear/view/widgets/line/custom_line.dart';
import 'package:mosmetro_wear/view/widgets/line/line_point.dart';
import 'package:mosmetro_wear/view/widgets/line/station_widget.dart';

class LineWidget extends StatelessWidget {
  final List<Station> routeSegment;
  final bool first;

  const LineWidget({
    required this.routeSegment,
    this.first = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Lines.lineColors[routeSegment.first.line]!;

    final firstStation = routeSegment.first;

    final middleStations = routeSegment.length - 2;

    return CustomPaint(
      painter: CustomLine(
        lineRatio: 6 / 11,
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              StationWidget(
                station: firstStation,
                routePoint: first ? PointType.number : PointType.fill,
              ),
              if (first && firstStation.boardingWagon != null)
                Image.asset(
                  switch (firstStation.boardingWagon!) {
                    BoardingWagon.first => 'assets/images/first_train.png',
                    BoardingWagon.middle => 'assets/images/middle_train.png',
                    BoardingWagon.last => 'assets/images/last_train.png'
                  },
                  width: 110,
                ),
            ],
          ),
          if (middleStations > 0)
            Row(
              children: [
                const SizedBox(width: 48),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      switch (middleStations) {
                        1 => '1 остановка',
                        < 5 => '$middleStations остановки',
                        _ => '$middleStations остановок'
                      },
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '(${middleStations * 4} мин)',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          StationWidget(
            station: routeSegment.last,
            routePoint: PointType.outline,
          ),
        ],
      ),
    );
  }
}
