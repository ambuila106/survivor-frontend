import 'package:flutter/material.dart';
import '../components/header_banner.dart';
import '../components/match_accordion/match_accordion.dart';

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
      {'pos': 1, 'name': 'Brandon', 'vidas': 3},
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

                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        headingTextStyle: const TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                        dataTextStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        columns: const [
                          DataColumn(label: Text('Pos')),
                          DataColumn(label: Text('Nombre')),
                          DataColumn(label: Text('Vidas')),
                        ],
                        rows: players.map((player) {
                          return DataRow(cells: [
                            DataCell(Text(player['pos'].toString())),
                            DataCell(Text(player['name'].toString())),
                            DataCell(Text(player['vidas'].toString())),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
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
