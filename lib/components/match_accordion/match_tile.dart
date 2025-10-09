import 'package:flutter/material.dart';
import 'team_selector.dart';

class MatchTile extends StatelessWidget {
  final Map<String, dynamic> match;
  final String? selectedTeamId;
  final Function(String) onSelectTeam;

  const MatchTile({
    super.key,
    required this.match,
    required this.selectedTeamId,
    required this.onSelectTeam,
  });

  @override
  Widget build(BuildContext context) {
    final homeTeam = match['home'] as Map<String, dynamic>;
    final visitorTeam = match['visitor'] as Map<String, dynamic>;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blueGrey[500]!.withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TeamSelector(
            teamName: homeTeam['name'],
            flagPath: homeTeam['flag'],
            isSelected: selectedTeamId == homeTeam['_id'],
            onTap: () => onSelectTeam(homeTeam['_id']),
            isHome: true,
          ),

          SizedBox(
            width: 37,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  match['date'] ?? '15 Ago',
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                Text(
                  match['time'] ?? '17:00',
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),

          TeamSelector(
            teamName: visitorTeam['name'],
            flagPath: visitorTeam['flag'],
            isSelected: selectedTeamId == visitorTeam['_id'],
            onTap: () => onSelectTeam(visitorTeam['_id']),
            isHome: false,
          ),
        ],
      ),
    );
  }
}
