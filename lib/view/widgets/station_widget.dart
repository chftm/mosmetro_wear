import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/models/station.dart';

enum StationCircle { number, filled, outlined }

class StationWidget extends StatelessWidget {
  const StationWidget({
    required this.station,
    required this.stationCircle,
    super.key,
  });

  final Station station;
  final StationCircle stationCircle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Container(
            decoration: stationCircle == StationCircle.outlined
                ? const BoxDecoration(
                    color: const Color.fromARGB(255, 51, 51, 51),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Colors.lightBlue,
                        width: 7,
                      ),
                    ),
                    shape: BoxShape.circle,
                  )
                : const BoxDecoration(
                    color: Colors.lightBlue,
                    shape: BoxShape.circle,
                  ),
            width: 32,
            height: 32,
            child: stationCircle == StationCircle.number
                ? Text(
                    station.line.toString(),
                    style: const TextStyle(fontSize: 23),
                    textAlign: TextAlign.center,
                  )
                : const SizedBox(),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              station.name,
              style: const TextStyle(fontSize: 23, height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
