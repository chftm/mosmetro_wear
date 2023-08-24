import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/models/station.dart';
import 'package:mosmetro_wear/view/widgets/custom_line.dart';
import 'package:mosmetro_wear/view/widgets/station_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('09:11', style: TextStyle(fontSize: 19)),
          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
          centerTitle: true,
          toolbarHeight: 25,
        ),
        body: const SafeArea(
          child: CustomPaint(
            painter: CustomLine(lineRatio: 1/2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StationWidget(
                  station: Station(name: 'Петровский парк', line: 1),
                  stationCircle: StationCircle.number,
                ),
                StationWidget(
                  station: Station(name: 'Петровский парк', line: 1),
                  stationCircle: StationCircle.outlined,
                ),
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.compact,
        colorScheme: const ColorScheme.dark().copyWith(
          background: const Color.fromARGB(255, 51, 51, 51),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
