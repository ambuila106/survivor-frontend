import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class LeaderboardTable extends StatefulWidget {
  final String survivorId;
  const LeaderboardTable({super.key, required this.survivorId});

  @override
  State<LeaderboardTable> createState() => _LeaderboardTableState();
}

class _LeaderboardTableState extends State<LeaderboardTable> {
  late Future<List<Map<String, dynamic>>> leaderboardFuture;

  @override
  void initState() {
    super.initState();
    leaderboardFuture = ApiService.getLeaderboard(widget.survivorId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: leaderboardFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final leaderboard = snapshot.data ?? [];

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            headingTextStyle: const TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
            ),
            dataTextStyle: const TextStyle(color: Colors.white),
            columns: const [
              DataColumn(label: Text('Pos')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Vidas')),
            ],
            rows: leaderboard.map((player) {
              return DataRow(cells: [
                DataCell(Text(player['rank'].toString())),
                DataCell(Text(player['playerName'].toString())),
                DataCell(Text(player['lives'].toString())),
              ]);
            }).toList(),
          ),
        );
      },
    );
  }
}
