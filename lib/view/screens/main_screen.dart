import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_event.dart';
import 'package:mosmetro_wear/data/models/station.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.read<RouteBloc>().add(
                const RouteStarted([
                  [
                    Station(
                      name: 'Минская',
                      line: 80,
                      boardingWagon: BoardingWagon.middle,
                    ),
                    Station(name: 'Ломоносовский проспект', line: 80),
                    Station(name: 'Раменки', line: 80),
                    Station(name: 'Мичуринский проспект', line: 80),
                  ],
                  [
                    Station(
                      name: 'Мичуринский проспект',
                      line: 11,
                      boardingWagon: BoardingWagon.first,
                    ),
                    Station(name: 'Проспект Вернадского', line: 11),
                    Station(name: 'Новаторская', line: 11),
                    Station(name: 'Воронцовская', line: 11),
                    Station(name: 'Зюзино', line: 11),
                  ],
                ]),
              ),
          child: const Text('Start route'),
        ),
      ),
    );
  }
}
