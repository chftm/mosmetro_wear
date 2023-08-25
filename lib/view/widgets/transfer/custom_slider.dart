import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({required this.onSliderSwipe, super.key});

  final Function() onSliderSwipe;

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      action: onSliderSwipe,
      radius: 30,
      boxShadow: const BoxShadow(color: Colors.black, blurRadius: 4),
      vibrationFlag: true,
      shimmer: true,
      height: 60,
      width: 190,
      alignLabel: Alignment(0.6, 0),
      backgroundColor: const Color.fromARGB(255, 80, 80, 80),
      baseColor: const Color.fromARGB(255, 201, 201, 201),
      buttonColor: Colors.greenAccent,
      highlightedColor: Colors.white,
      label: const Text(
        'Переход',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      icon: const Center(
        child: Icon(
          Icons.directions_walk,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
