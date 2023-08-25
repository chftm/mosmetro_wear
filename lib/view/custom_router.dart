import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_bloc.dart';
import 'package:mosmetro_wear/bloc/route/route_state.dart';
import 'package:mosmetro_wear/view/screens/main_screen.dart';
import 'package:mosmetro_wear/view/screens/route_screen.dart';

class CustomRouter extends StatelessWidget {
  const CustomRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteBloc, RouteState>(
      builder: (_, state) =>
          state.routeExists ? const RouteScreen() : const MainScreen(),
    );
  }
}
