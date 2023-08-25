import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({required this.onSliderSwipe, super.key});

  final void Function() onSliderSwipe;

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      action: onSliderSwipe,
      radius: 30,
      boxShadow: const BoxShadow(blurRadius: 4),
      vibrationFlag: true,
      height: 60,
      width: 190,
      backgroundColor: const Color(0xff505050),
      baseColor: const Color(0xffc9c9c9),
      buttonColor: Colors.greenAccent,
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
