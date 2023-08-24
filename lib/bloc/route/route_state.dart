import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/models/station.dart';

@immutable
final class RouteState {
  final List<Station>? route;
  final int currentStation;

  bool get routeExists => route != null;

  const RouteState({
    required this.route,
    this.currentStation = 0,
  });

  RouteState copyWith({List<Station>? route, int? currentStation}) {
    return RouteState(
      route: route ?? this.route,
      currentStation: currentStation ?? this.currentStation,
    );
  }
}
