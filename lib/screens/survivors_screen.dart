import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'survival_screen.dart';
import '../components/header_banner.dart';

class SurvivorsScreen extends StatelessWidget {
  final String playerId;

  const SurvivorsScreen({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // 🟡 Banner reutilizado
          SizedBox(
            height: 330,
            child: HeaderBanner(title: 'Survivors', isSimple: true),
          ),

          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: ApiService.getAllSurvivors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }

                final survivors = snapshot.data!;

                return ListView.builder(
                  itemCount: survivors.length,
                  itemBuilder: (context, index) {
                    final survivor = survivors[index];
                    final survivorId = survivor['_id'];
                    final name = survivor['name'];

                    return FutureBuilder<Map<String, dynamic>>(
                      future: ApiService.getPlayerSurvivorData(survivorId, playerId),
                      builder: (context, playerSnapshot) {
                        String subtitle = '';
                        if (playerSnapshot.hasData) {
                          final player = playerSnapshot.data!['player'];
                          subtitle =
                              'Vidas: ${player['lives']}/${player['totalLives']} • Posición: ${player['position']}/${player['totalPlayers']}';
                        }

                        return Card(
                          color: Colors.grey[900]!.withOpacity(0.8),
                          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          child: ListTile(
                            title: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
                            trailing: const Icon(Icons.arrow_forward, color: Colors.yellow),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SurvivalScreen(
                                    survivorId: survivorId,
                                    playerId: playerId,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
