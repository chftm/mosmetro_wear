import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/models/station.dart';

@immutable
sealed class RouteEvent {
  const RouteEvent();
}

class RouteStarted extends RouteEvent {
  final List<Station> route;

  const RouteStarted(this.route);
}

class NextStation extends RouteEvent {
  const NextStation();
}
