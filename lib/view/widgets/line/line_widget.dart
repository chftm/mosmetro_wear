import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/models/station.dart';
import 'package:mosmetro_wear/view/widgets/line/custom_line.dart';
import 'package:mosmetro_wear/view/widgets/line/line_point.dart';
import 'package:mosmetro_wear/view/widgets/line/station_widget.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const CustomLine(lineRatio: 6 / 11, color: Colors.lightBlue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const StationWidget(
            station: Station(name: 'Савёловская', line: 1),
            routePoint: PointType.number,
            color: Colors.lightBlue,
          ),
          Image.asset(
            'assets/images/first_train.png',
            width: 110,
          ),
          const Row(
            children: [
              SizedBox(width: 48),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2 пересадки',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '(8 мин)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const StationWidget(
            station: Station(name: 'Петровский парк', line: 1),
            routePoint: PointType.outline,
            color: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}
