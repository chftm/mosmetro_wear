import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosmetro_wear/bloc/movement/movement_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_event.dart';
import 'package:mosmetro_wear/bloc/route/route_state.dart';
import 'package:mosmetro_wear/view/widgets/line/line_widget.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RouteBloc, RouteState>(
        builder: (_, state) => BlocListener<MovementBloc, bool>(
          listener: (_, moving) {
            if (moving) {
              context.read<RouteBloc>().add(const NextStation());
            }
          },
          child: LineWidget(
            routeSegment:
                state.currentSegment!.sublist(state.currentStationIndex),
            first: state.isFirstInSegment,
          ),
        ),
      ),
    );
  }
}
