import 'package:flutter/material.dart';

class TeamSelector extends StatelessWidget {
  final String teamName;
  final String flagPath;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isHome;

  const TeamSelector({
    super.key,
    required this.teamName,
    required this.flagPath,
    required this.isSelected,
    required this.onTap,
    required this.isHome,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        width: isHome ? 150 : 160,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.deepPurple
              : Colors.blueGrey[900]!.withOpacity(.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment:
              isHome ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: isHome
              ? [
                  Image.asset('assets/arg.png', width: 22, height: 22),
                  const SizedBox(width: 8),
                  Text(
                    teamName,
                    style: TextStyle(
                        fontFamily: 'LeagueGothic',
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 18),
                  ),
                ]
              : [
                  Text(
                    teamName,
                    style: TextStyle(
                        fontFamily: 'LeagueGothic',
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  Image.asset('assets/arg.png', width: 22, height: 22),
                ],
        ),
      ),
    );
  }
}
