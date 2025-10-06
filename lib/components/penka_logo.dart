import 'package:flutter/material.dart';

class PenkaLogo extends StatelessWidget {
  const PenkaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/by_penka.png',
      height: 40,
      fit: BoxFit.contain,
    );
  }
}
