import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosmetro_wear/bloc/movement/movement_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_bloc.dart';
import 'package:mosmetro_wear/data/movement/movement_repository.dart';
import 'package:mosmetro_wear/view/custom_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RouteBloc>(
          create: (_) => RouteBloc(),
        ),
        BlocProvider<MovementBloc>(
          create: (_) => MovementBloc(
            const MovementRepository(
              thresholdVelocity: 1,
            ),
          )..add(const StartMovementTracking()),
        ),
      ],
      child: MaterialApp(
        home: const CustomRouter(),
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.compact,
          colorScheme: const ColorScheme.dark().copyWith(
            background: const Color(0xff333333),
          ),
          fontFamily: 'Ubuntu',
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
