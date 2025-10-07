import 'package:flutter/material.dart';
import 'screens/survivors_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String playerId = "68e5900a651e6d0b43d6299d";

    return MaterialApp(
      title: 'Survivor App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SurvivorsScreen(playerId: playerId),
    );
  }
}
