import 'package:flutter/material.dart';
import '../components/header_banner.dart';
import '../components/match_accordion/match_accordion.dart';
import '../services/api_service.dart';
import '../components/leaderboard_table.dart';

class SurvivalScreen extends StatelessWidget {
  final String survivorId;
  final String playerId;

  const SurvivalScreen({
    super.key,
    required this.survivorId,
    required this.playerId,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: FutureBuilder<Map<String, dynamic>>(
            future: ApiService.getPlayerSurvivorData(survivorId, playerId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasError) {
                final playerData = snapshot.data!['player'];
                final survivorName = snapshot.data!['survivor'];

                return HeaderBanner(
                  title: survivorName,
                  lives: playerData['lives'],
                  totalLives: playerData['totalLives'],
                  position: playerData['position'],
                  totalPlayers: playerData['totalPlayers'],
                  pot: playerData['pot'],
                  survivors: playerData['survivors'],
                );
              } else {
                return HeaderBanner(title: 'Survivor', isSimple: true);
              }


            },
          ),

        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.yellow[700],
              labelColor: Colors.yellow[700],
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(text: 'Por jugar'),
                Tab(text: 'Resultados'),
                Tab(text: 'Tabla'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder<Map<String, dynamic>>(
                    future: ApiService.getSurvivorWithMatches(survivorId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      final survivor = snapshot.data!;
                      final gameweeks = survivor['gameweeks'] as List<dynamic>;

                      return ListView.builder(
                        itemCount: gameweeks.length,
                        itemBuilder: (context, index) {
                          final gw = gameweeks[index];
                          final matches = (gw['matches'] as List<dynamic>)
                              .map((m) => m as Map<String, dynamic>)
                              .toList();

                          return MatchAccordion(
                            title: 'Jornada ${gw['number']}',
                            matches: matches,
                            survivorId: survivorId,
                            playerId: playerId,
                            gameweekId: gw['_id'],
                          );
                        },
                      );
                    },
                  ),
                  const Center(
                      child: Text('Resultados', style: TextStyle(color: Colors.white))),
                  LeaderboardTable(survivorId: survivorId),
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
