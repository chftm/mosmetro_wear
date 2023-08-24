import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/movement/movement_repository.dart';

final class MovementBloc extends Bloc<StartMovementTrackingEvent, bool> {
  final MovementRepository repository;

  MovementBloc(this.repository) : super(false) {
    on<StartMovementTrackingEvent>(
      (event, emit) => emit.forEach(
        repository.movement,
        onData: (d) => d,
      ),
    );
  }
}

@immutable
final class StartMovementTrackingEvent {
  const StartMovementTrackingEvent();
}
