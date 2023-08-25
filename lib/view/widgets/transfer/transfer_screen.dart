import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/models/station.dart';
import 'package:mosmetro_wear/view/widgets/line/line_point.dart';
import 'package:mosmetro_wear/view/widgets/line/station_widget.dart';
import 'package:mosmetro_wear/view/widgets/transfer/custom_slider.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const StationWidget(
            station: Station(name: 'Бульвар дмитрия донского', line: 1),
            routePoint: PointType.number,
          ),
          CustomSlider(onSliderSwipe: () {}),
          const StationWidget(
            station: Station(name: 'Бульвар дмитрия донского', line: 1),
            routePoint: PointType.number,
          ),
        ],
      ),
    );
  }
}
