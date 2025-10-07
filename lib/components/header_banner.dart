import 'package:flutter/material.dart';
import 'stat_card.dart';
import 'penka_logo.dart';

class HeaderBanner extends StatelessWidget {
  final String survivorName;
  final int lives;
  final int totalLives;
  final int position;
  final int totalPlayers;
  final int pot;
  final int survivors;

  const HeaderBanner({
    super.key,
    required this.survivorName,
    required this.lives,
    required this.totalLives,
    required this.position,
    required this.totalPlayers,
    required this.pot,
    required this.survivors,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/stadium.png', fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.6),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    survivorName.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'LeagueGothic',
                      color: Colors.white,
                      fontSize: 50,
                      letterSpacing: 1.5,
                      height: .7,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatCard(
                        value: '$lives/$totalLives',
                        label: 'VIDAS',
                        icon: Icons.favorite,
                        iconColor: Colors.red,
                        width: 75,
                      ),
                      StatCard(
                        value: '$position/$totalPlayers',
                        label: 'POSICIÓN',
                        icon: Icons.emoji_events,
                        iconColor: Colors.amber,
                        width: 85,
                      ),
                      StatCard(
                        value: '\$$pot',
                        label: 'POZO ACUMULADO',
                        icon: Icons.monetization_on,
                        iconColor: Colors.green,
                        width: 105,
                      ),
                      StatCard(
                        value: '$survivors',
                        label: 'SOBREVIVIENTES',
                        icon: Icons.people,
                        iconColor: Colors.blue,
                        width: 105,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const PenkaLogo(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
