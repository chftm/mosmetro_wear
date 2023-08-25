import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

@immutable
final class MovementRepository {
  final double thresholdVelocity;

  Stream<bool> get movement => userAccelerometerEvents
      .map(
        (event) {
          final acceleration = sqrt(event.x * event.x + event.z * event.z);

          return acceleration >= thresholdVelocity;
        },
      )
      .distinct()
      .asBroadcastStream();

  const MovementRepository({required this.thresholdVelocity});
}
