import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/models/station.dart';

@immutable
sealed class RouteEvent {
  const RouteEvent();
}

final class RouteStarted extends RouteEvent {
  final List<List<Station>> route;

  const RouteStarted(this.route);
}

final class NextStation extends RouteEvent {
  const NextStation();
}
