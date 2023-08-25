import 'package:flutter/material.dart';
import 'package:mosmetro_wear/view/widgets/line/line_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: LineWidget(),
      ),
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.compact,
        colorScheme: const ColorScheme.dark().copyWith(
          background: const Color.fromARGB(255, 51, 51, 51),
        ),
        fontFamily: 'Ubuntu',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
