import 'package:flutter/material.dart';

class WatchWrapper extends StatelessWidget {
  final Widget child;

  const WatchWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: 201,
          height: 238,
          child: child,
        ),
      ),
    );
  }
}
