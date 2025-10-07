import 'package:flutter/material.dart';
import 'stat_card.dart';
import 'penka_logo.dart';

class HeaderBanner extends StatelessWidget {
  final String title;
  final int? lives;
  final int? totalLives;
  final int? position;
  final int? totalPlayers;
  final int? pot;
  final int? survivors;
  final bool isSimple;

  const HeaderBanner({
    super.key,
    required this.title,
    this.lives,
    this.totalLives,
    this.position,
    this.totalPlayers,
    this.pot,
    this.survivors,
    this.isSimple = false,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'LeagueGothic',
                      color: Colors.white,
                      fontSize: 50,
                      letterSpacing: 1.5,
                      height: .9,
                    ),
                  ),
                  if (!isSimple) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatCard(
                          value: '${lives ?? 0}/${totalLives ?? 0}',
                          label: 'VIDAS',
                          icon: Icons.favorite,
                          iconColor: Colors.red,
                          width: 75,
                        ),
                        StatCard(
                          value: '${position ?? 0}/${totalPlayers ?? 0}',
                          label: 'POSICIÓN',
                          icon: Icons.emoji_events,
                          iconColor: Colors.amber,
                          width: 85,
                        ),
                        StatCard(
                          value: '\$${pot ?? 0}',
                          label: 'POZO ACUMULADO',
                          icon: Icons.monetization_on,
                          iconColor: Colors.green,
                          width: 105,
                        ),
                        StatCard(
                          value: '${survivors ?? 0}',
                          label: 'SOBREVIVIENTES',
                          icon: Icons.people,
                          iconColor: Colors.blue,
                          width: 105,
                        ),
                      ],
                    ),
                  ],
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
