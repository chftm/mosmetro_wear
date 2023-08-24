import 'package:flutter/material.dart';

@immutable
final class Station {
  final String name;
  final int line;

  const Station({
    required this.name,
    required this.line,
  });
}
