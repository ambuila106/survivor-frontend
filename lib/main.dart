import 'package:flutter/material.dart';
import 'screens/survivors_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String playerId = "68e48469112b41b9d0729f0e";

    return MaterialApp(
      title: 'Survivor App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SurvivorsScreen(playerId: playerId),
    );
  }
}
