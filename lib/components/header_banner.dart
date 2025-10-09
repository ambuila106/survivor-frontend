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
    final stats = [
      {
        'value': '${lives ?? 0}/${totalLives ?? 0}',
        'label': 'VIDAS',
        'icon': Icons.favorite,
        'color': Colors.red,
        'width': 75.0,
      },
      {
        'value': '${position ?? 0}/${totalPlayers ?? 0}',
        'label': 'POSICIÓN',
        'icon': Icons.emoji_events,
        'color': Colors.amber,
        'width': 85.0,
      },
      {
        'value': '\$${pot ?? 0}',
        'label': 'POZO ACUMULADO',
        'icon': Icons.monetization_on,
        'color': Colors.green,
        'width': 105.0,
      },
      {
        'value': '${survivors ?? 0}',
        'label': 'SOBREVIVIENTES',
        'icon': Icons.people,
        'color': Colors.blue,
        'width': 105.0,
      },
    ];

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
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: stats
                            .map(
                              (stat) => StatCard(
                                value: stat['value'] as String,
                                label: stat['label'] as String,
                                icon: stat['icon'] as IconData,
                                iconColor: stat['color'] as Color,
                                width: stat['width'] as double,
                              ),
                            )
                            .toList(),
                      ),
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
