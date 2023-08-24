import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/models/station.dart';

@immutable
final class RouteState {
  final List<Station>? route;
  final int currentStationIndex;

  Station? get currentStation => route?[currentStationIndex];

  bool get routeExists => route != null;

  bool get isLastStation =>
      routeExists && currentStationIndex == route!.length - 1;

  bool get isTransfer =>
      routeExists &&
      !isLastStation &&
      currentStation!.line != route![currentStationIndex + 1].line;

  bool get isFirstInSegment =>
      routeExists &&
      (currentStationIndex == 0 ||
          currentStation!.line != route![currentStationIndex - 1].line);

  const RouteState({
    required this.route,
    this.currentStationIndex = 0,
  });

  RouteState copyWith({List<Station>? route, int? currentStationIndex}) {
    return RouteState(
      route: route ?? this.route,
      currentStationIndex: currentStationIndex ?? this.currentStationIndex,
    );
  }
}
