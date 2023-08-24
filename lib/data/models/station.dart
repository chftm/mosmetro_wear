import 'package:flutter/material.dart';

@immutable
final class Station {
  final String name;
  final int line;
  final BoardingWagon? boardingWagon;

  const Station({
    required this.name,
    required this.line,
    this.boardingWagon,
  });
}

enum BoardingWagon {
  first,
  middle,
  last,
}
