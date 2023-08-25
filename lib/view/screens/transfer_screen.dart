import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_event.dart';
import 'package:mosmetro_wear/data/models/station.dart';
import 'package:mosmetro_wear/view/watch_wrapper.dart';
import 'package:mosmetro_wear/view/widgets/line/line_point.dart';
import 'package:mosmetro_wear/view/widgets/line/station_widget.dart';
import 'package:mosmetro_wear/view/widgets/transfer/custom_slider.dart';

class TransferScreen extends StatelessWidget {
  final Station from;
  final Station to;

  const TransferScreen({
    required this.from,
    required this.to,
    super.key,
  });

  void _onSwipe(BuildContext context) {
    context.read<RouteBloc>().add(const NextStation());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WatchWrapper(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StationWidget(
              station: from,
              routePoint: PointType.number,
            ),
            CustomSlider(onSliderSwipe: () => _onSwipe(context)),
            StationWidget(
              station: to,
              routePoint: PointType.number,
            ),
          ],
        ),
      ),
    );
  }
}
