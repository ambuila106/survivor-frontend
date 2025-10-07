import 'package:flutter/material.dart';

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
  // Guardará el equipo seleccionado por cada partido
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
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          children: widget.matches.asMap().entries.map((entry) {
            final index = entry.key;
            final match = entry.value;
            final selected = selectedTeams[index];

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 1),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blueGrey[500]!.withOpacity(0.4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 🟥 Equipo local
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTeams[index] = match['home'];
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      width: 150,
                      decoration: BoxDecoration(
                        color: selected == match['home']
                            ? Colors.deepPurple
                            : Colors.blueGrey[900]!.withOpacity(.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            match['homeFlag'],
                            width: 22,
                            height: 22,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            match['home'],
                            style: TextStyle(
                              fontFamily: 'LeagueGothic',
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 🕐 Hora
                  SizedBox(
                    width: 37, // ancho suficiente
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

                  // 🟦 Equipo visitante
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTeams[index] = match['away'];
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      width: 160,
                      decoration: BoxDecoration(
                        color: selected == match['away']
                            ? Colors.deepPurple
                            : Colors.blueGrey[900]!.withOpacity(.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            match['away'],
                            style: TextStyle(
                              fontFamily: 'LeagueGothic',
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Image.asset(
                            match['awayFlag'],
                            width: 22,
                            height: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
