import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mosmetro_wear/data/movement/movement_repository.dart';

final class MovementBloc extends Bloc<StartMovementTracking, bool> {
  final MovementRepository repository;

  MovementBloc(this.repository) : super(false) {
    on<StartMovementTracking>(
      (event, emit) => emit.forEach(
        repository.movement,
        onData: (d) => d,
      ),
    );
  }
}

@immutable
final class StartMovementTracking {
  const StartMovementTracking();
}
