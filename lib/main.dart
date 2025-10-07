import 'package:flutter/material.dart';
import 'screens/survivors_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String playerId = "68e5807f651e6d0b43d626d7";

    return MaterialApp(
      title: 'Survivor App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SurvivorsScreen(playerId: playerId),
    );
  }
}
