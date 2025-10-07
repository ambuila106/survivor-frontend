import 'package:flutter/material.dart';
import '../components/header_banner.dart';
import '../components/match_accordion/match_accordion.dart';
import '../components/leaderboard_table.dart';

class SurvivalScreen extends StatelessWidget {
  const SurvivalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matches = [
      {
        'home': 'Girona',
        'away': 'Rayo Vallecano',
        'homeFlag': 'assets/arg.png',
        'awayFlag': 'assets/arg.png',
        'time': '15 Ago 07:00',
      },
      {
        'home': 'Mallorca',
        'away': 'Barcelona',
        'homeFlag': 'assets/arg.png',
        'awayFlag': 'assets/arg.png',
        'time': '15 Ago 07:00',
      },
      {
        'home': 'Real Madrid',
        'away': 'Athletic Club',
        'homeFlag': 'assets/arg.png',
        'awayFlag': 'assets/arg.png',
        'time': '15 Ago 07:00',
      },
      {
        'home': 'Valencia',
        'away': 'Villarreal',
        'homeFlag': 'assets/arg.png',
        'awayFlag': 'assets/arg.png',
        'time': '15 Ago 07:00',
      },
      {
        'home': 'Sevilla',
        'away': 'Atlético de Madrid',
        'homeFlag': 'assets/arg.png',
        'awayFlag': 'assets/arg.png',
        'time': '15 Ago 07:00',
      },
      {
        'home': 'Celta de Vigo',
        'away': 'Real Sociedad',
        'homeFlag': 'assets/arg.png',
        'awayFlag': 'assets/arg.png',
        'time': '15 Ago 07:00',
      }
    ];

    final players = [
      {'pos': 1, 'name': 'Brandon s', 'vidas': 3},
      {'pos': 2, 'name': 'Alice', 'vidas': 2},
      {'pos': 3, 'name': 'Juan', 'vidas': 1},
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: const HeaderBanner(),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.yellow[700],
              labelColor: Colors.yellow[700],
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(
                fontSize: 14,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(text: 'Por jugar'),
                Tab(text: 'Resultados'),
                Tab(text: 'Tabla'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      MatchAccordion(title: 'Jornada 1', matches: matches),
                      MatchAccordion(title: 'Jornada 2', matches: matches),
                      MatchAccordion(title: 'Jornada 3', matches: matches),
                    ],
                  ),

                  const Center(child: Text('Resultados', style: TextStyle(color: Colors.white))),

                  LeaderboardTable(survivorId: '68e3e1ac11685eb2571fc189'),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
