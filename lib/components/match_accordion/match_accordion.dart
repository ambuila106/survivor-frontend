import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import 'match_tile.dart';

// Estado global: survivorId → (gameweekId → teamId)
final Map<String, Map<String, String>> globalSelectedTeams = {};

class MatchAccordion extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> matches;
  final String survivorId;
  final String playerId;
  final String gameweekId;

  const MatchAccordion({
    super.key,
    required this.title,
    required this.matches,
    required this.survivorId,
    required this.playerId,
    required this.gameweekId,
  });

  @override
  State<MatchAccordion> createState() => _MatchAccordionState();
}

class _MatchAccordionState extends State<MatchAccordion> {
  String? selectedTeamId; // selección de esta jornada

  @override
  void initState() {
    super.initState();
    // Cargar la selección guardada globalmente si existe
    selectedTeamId = globalSelectedTeams[widget.survivorId]?[widget.gameweekId];
  }

  void pickTeam({
    required String matchId,
    required String teamId,
  }) async {
    try {
      await ApiService.pickTeam(
        playerId: widget.playerId,
        survivorId: widget.survivorId,
        matchId: matchId,
        teamId: teamId,
        gameweekId: widget.gameweekId,
      );

      setState(() {
        selectedTeamId = teamId; // guardamos local

        // guardamos globalmente por survivor y jornada
        globalSelectedTeams.putIfAbsent(widget.survivorId, () => {});
        globalSelectedTeams[widget.survivorId]![widget.gameweekId] = teamId;
      });
    } catch (e) {
      print("Error al seleccionar equipo: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al seleccionar equipo: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[900]!.withOpacity(0.6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpansionTile(
          collapsedIconColor: Colors.white70,
          iconColor: Colors.white70,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          children: widget.matches.map((match) {
            return MatchTile(
              match: match,
              selectedTeamId: selectedTeamId,
              onSelectTeam: (teamId) {
                pickTeam(matchId: match['_id'], teamId: teamId);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
