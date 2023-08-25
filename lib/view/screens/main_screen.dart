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
                      name: 'Савеловская',
                      line: 1,
                      boardingWagon: BoardingWagon.middle,
                    ),
                    Station(name: 'Остановка 1', line: 1),
                    Station(name: 'Остановка 2', line: 1),
                    Station(name: 'Петровский Парк', line: 1),
                  ],
                  [
                    Station(
                      name: 'Савеловская',
                      line: 4,
                      boardingWagon: BoardingWagon.middle,
                    ),
                    Station(name: 'Остановка 1', line: 4),
                    Station(name: 'Остановка 2', line: 4),
                    Station(name: 'Петровский Парк', line: 4),
                  ],
                ]),
              ),
          child: const Text('Start route'),
        ),
      ),
    );
  }
}
