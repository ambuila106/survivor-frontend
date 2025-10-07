import 'package:flutter/material.dart';
import 'team_selector.dart';

class MatchTile extends StatelessWidget {
  final Map<String, dynamic> match;
  final String? selectedTeam;
  final Function(String) onSelectTeam;

  const MatchTile({
    super.key,
    required this.match,
    required this.selectedTeam,
    required this.onSelectTeam,
  });

  @override
  Widget build(BuildContext context) {
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
            teamName: match['home'],
            flagPath: match['homeFlag'],
            isSelected: selectedTeam == match['home'],
            onTap: () => onSelectTeam(match['home']),
            isHome: true,
          ),
          SizedBox(
            width: 37,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  match['date'] ?? '',
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                Text(
                  match['time'] ?? '',
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
          TeamSelector(
            teamName: match['away'],
            flagPath: match['awayFlag'],
            isSelected: selectedTeam == match['away'],
            onTap: () => onSelectTeam(match['away']),
            isHome: false,
          ),
        ],
      ),
    );
  }
}
