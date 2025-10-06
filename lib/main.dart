import 'package:flutter/material.dart';
import 'screens/survival_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survival App',
      theme: ThemeData.dark(),
      home: const SurvivalScreen(),
    );
  }
}
