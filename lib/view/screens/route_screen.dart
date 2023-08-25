import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosmetro_wear/bloc/movement/movement_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_event.dart';
import 'package:mosmetro_wear/bloc/route/route_state.dart';
import 'package:mosmetro_wear/view/screens/transfer_screen.dart';
import 'package:mosmetro_wear/view/widgets/line/line_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  // In this case, it's clear what the flag refers to.
  // ignore: avoid_positional_boolean_parameters
  void _handleMovement(BuildContext context, bool isMoving) {
    if (isMoving) {
      context.read<RouteBloc>().add(const NextStation());
    }
  }

  void _handleStationChange(
    BuildContext context,
    RouteState state,
    PageController controller,
  ) {
    controller.animateToPage(
      state.currentSegmentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    if (state.isTransfer) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => TransferScreen(
            from: state.currentStation!,
            to: state.route![state.currentSegmentIndex + 1].first,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RouteBloc>();
    final state = bloc.state;

    final pageCount = state.route!.length;

    final controller = PageController(
      initialPage: state.currentSegmentIndex,
    );

    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<RouteBloc, RouteState>(
            listener: (context, state) =>
                _handleStationChange(context, state, controller),
          ),
          BlocListener<MovementBloc, bool>(
            listener: _handleMovement,
            listenWhen: (_, __) => ModalRoute.of(context)!.isCurrent,
          ),
        ],
        child: Row(
          children: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: controller,
                itemBuilder: (_, index) {
                  if (index != state.currentSegmentIndex) {
                    return LineWidget(routeSegment: state.route![index]);
                  }

                  return LineWidget(
                    routeSegment: state.currentSegment!
                        .sublist(state.currentStationIndex),
                    first: state.isFirstInSegment,
                  );
                },
                itemCount: pageCount,
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: pageCount,
              axisDirection: Axis.vertical,
              effect: const ExpandingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
