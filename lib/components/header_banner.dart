import 'package:flutter/material.dart';
import 'stat_card.dart';
import 'penka_logo.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

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
                  const Text(
                    'SURVIVAL LA LIGA',
                    style: TextStyle(
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
                    children: const [
                      StatCard(
                        value: '3.5/5',
                        label: 'VIDAS',
                        icon: Icons.favorite,
                        iconColor: Colors.red,
                        width: 75,
                      ),
                      StatCard(
                        value: '22/1000',
                        label: 'POSICIÓN',
                        icon: Icons.emoji_events,
                        iconColor: Colors.amber,
                        width: 85,
                      ),
                      StatCard(
                        value: '20k',
                        label: 'POZO ACUMULADO',
                        icon: Icons.monetization_on,
                        iconColor: Colors.green,
                        width: 105,
                      ),
                      StatCard(
                        value: '20k',
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
