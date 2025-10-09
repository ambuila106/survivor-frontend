import 'package:flutter/material.dart';
import 'match_selection_controller.dart';
import 'match_tile.dart';

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
  late MatchSelectionController controller;
  String? selectedTeamId;

  @override
  void initState() {
    super.initState();
    controller = MatchSelectionController(
      playerId: widget.playerId,
      survivorId: widget.survivorId,
      gameweekId: widget.gameweekId,
    );
    selectedTeamId = controller.getSelectedTeam();
  }

  Future<void> handlePickTeam(String matchId, String teamId) async {
    final success = await controller.pickTeam(context, matchId: matchId, teamId: teamId);
    if (success) {
      setState(() => selectedTeamId = teamId);
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
              onSelectTeam: (teamId) => handlePickTeam(match['_id'], teamId),
            );
          }).toList(),
        ),
      ),
    );
  }
}
