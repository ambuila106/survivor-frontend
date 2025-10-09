import 'package:flutter/material.dart';

class SurvivorCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final VoidCallback onTap;

  const SurvivorCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900]!.withOpacity(0.8),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(Icons.arrow_forward, color: Colors.yellow),
        onTap: onTap,
      ),
    );
  }
}
