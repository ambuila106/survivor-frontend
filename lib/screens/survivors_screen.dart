import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../components/header_banner.dart';
import '../components/survivor_list.dart';

class SurvivorsScreen extends StatelessWidget {
  final String playerId;

  const SurvivorsScreen({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 330,
            child: HeaderBanner(title: 'Survivors', isSimple: true),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: ApiService.getAllSurvivors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }

                final survivors = snapshot.data!;
                return SurvivorList(survivors: survivors, playerId: playerId);
              },
            ),
          ),
        ],
      ),
    );
  }
}
