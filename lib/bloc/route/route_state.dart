import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/models/station.dart';

@immutable
final class RouteState {
  final List<List<Station>>? route;
  final int currentSegmentIndex;
  final int currentStationIndex;

  List<Station>? get currentSegment => route?[currentSegmentIndex];
  Station? get currentStation => currentSegment?[currentStationIndex];

  bool get routeExists => route != null;

  bool get isLastStation =>
      routeExists &&
      currentSegmentIndex == route!.length - 1 &&
      currentStationIndex == currentSegment!.length - 1;

  bool get isTransfer =>
      routeExists &&
      currentSegmentIndex != route!.length - 1 &&
      currentStationIndex == currentSegment!.length - 1;

  bool get isFirstInSegment => currentStationIndex == 0;

  const RouteState({
    required this.route,
    this.currentSegmentIndex = 0,
    this.currentStationIndex = 0,
  });

  RouteState copyWith({
    List<List<Station>>? route,
    int? currentSegmentIndex,
    int? currentStationIndex,
  }) {
    return RouteState(
      route: route ?? this.route,
      currentSegmentIndex: currentSegmentIndex ?? this.currentSegmentIndex,
      currentStationIndex: currentStationIndex ?? this.currentStationIndex,
    );
  }
}
