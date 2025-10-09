import 'package:flutter/material.dart';
import '../screens/survival_screen.dart';
import 'survivor_card.dart';

class SurvivorList extends StatelessWidget {
  final List<Map<String, dynamic>> survivors;
  final String playerId;

  const SurvivorList({
    super.key,
    required this.survivors,
    required this.playerId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: survivors.length,
      itemBuilder: (context, index) {
        final survivor = survivors[index];
        final survivorId = survivor['_id'];
        final name = survivor['name'];

        return SurvivorCard(
          name: name,
          subtitle: 'Ver detalles del survivor',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SurvivalScreen(
                  survivorId: survivorId,
                  playerId: playerId,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
