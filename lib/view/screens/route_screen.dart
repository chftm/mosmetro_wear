import 'package:flutter/material.dart';
import 'package:mosmetro_wear/view/widgets/line/line_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final controller = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  );

  final List<Widget> pages = [
    // LineWidget(),
    // LineWidget(),
    // LineWidget(),
  ];

  void onSliderSwipe() {
    Navigator.pop(context);
  }

  // showCupertinoModalPopup(
  //   context: context,
  //   builder: (ctx) {
  //     return TransferScreen(
  //       onSliderSwipe: onSliderSwipe,
  //     );
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            controller: controller,
            itemBuilder: (ctx, index) {
              return pages[index];
            },
            itemCount: pages.length,
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: pages.length,
          axisDirection: Axis.vertical,
          effect: const ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            activeDotColor: Colors.white,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
