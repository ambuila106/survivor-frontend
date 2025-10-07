import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'survival_screen.dart';

class SurvivorsScreen extends StatelessWidget {
  final String playerId; // Id del jugador actual

  const SurvivorsScreen({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survivors'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: ApiService.getAllSurvivors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
          }

          final survivors = snapshot.data!;

          return ListView.builder(
            itemCount: survivors.length,
            itemBuilder: (context, index) {
              final survivor = survivors[index];
              final survivorId = survivor['_id'];
              final name = survivor['name'];
              final startDate = survivor['startDate'];
              final totalLives = survivor['lives'];

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
    );
  }
}
