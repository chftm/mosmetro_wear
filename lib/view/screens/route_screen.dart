import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_bloc.dart';
import 'package:mosmetro_wear/view/widgets/line/line_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  void onSliderSwipe() {}

  @override
  Widget build(BuildContext context) {
    final state = context.read<RouteBloc>().state;

    final controller = PageController(
      initialPage: state.currentSegmentIndex,
    );

    return Scaffold(
      body: Row(
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
                  routeSegment:
                      state.currentSegment!.sublist(state.currentStationIndex),
                  first: state.isFirstInSegment,
                );
              },
              itemCount: state.route!.length,
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: state.route!.length,
            axisDirection: Axis.vertical,
            effect: const ExpandingDotsEffect(
              dotWidth: 8,
              dotHeight: 8,
              activeDotColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
