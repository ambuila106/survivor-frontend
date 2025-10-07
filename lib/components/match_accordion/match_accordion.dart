import 'package:flutter/material.dart';
import 'match_tile.dart';

class MatchAccordion extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> matches;

  const MatchAccordion({
    super.key,
    required this.title,
    required this.matches,
  });

  @override
  State<MatchAccordion> createState() => _MatchAccordionState();
}

class _MatchAccordionState extends State<MatchAccordion> {
  final Map<int, String?> selectedTeams = {};

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900]!.withOpacity(0.6),
          borderRadius: BorderRadius.circular(0),
        ),
        child: ExpansionTile(
          collapsedIconColor: Colors.white70,
          iconColor: Colors.white70,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          children: widget.matches.asMap().entries.map((entry) {
            final index = entry.key;
            final match = entry.value;

            return MatchTile(
              match: match,
              selectedTeam: selectedTeams[index],
              onSelectTeam: (team) {
                setState(() {
                  selectedTeams[index] = team;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
