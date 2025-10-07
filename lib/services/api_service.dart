import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://unperfect-ulysses-lamprophonic.ngrok-free.dev/api";

  static Future<List<Map<String, dynamic>>> getAllSurvivors() async {
    final response = await http.get(Uri.parse("$baseUrl/survivor/"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception("Failed to load survivors");
    }
  }

  static Future<Map<String, dynamic>> getSurvivorById(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/survivor/$id"));
    if (response.statusCode == 200) {
      print("Survivor data: ${response.body}");
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load survivor");
    }
  }

  // ── Survivor ──
static Future<Map<String, dynamic>> getSurvivorWithMatches(String survivorId) async {
  final response = await http.get(Uri.parse("$baseUrl/survivor/$survivorId"));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    // data contiene: _id, name, gameweeks, ...
    return data;
  } else {
    throw Exception("Failed to load survivor");
  }
}


  static Future<Map<String, dynamic>> createPlayer(String name) async {
    final response = await http.post(
      Uri.parse("$baseUrl/players"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name}),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to create player");
    }
  }

  static Future<List<dynamic>> getAllPlayers() async {
    final response = await http.get(Uri.parse("$baseUrl/players"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load players");
    }
  }

  static Future<void> joinSurvivor(String playerId, String survivorId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/survivor/join"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "playerId": playerId,
        "survivorId": survivorId,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to join survivor");
    }
  }

  static Future<void> pickTeam({
    required String playerId,
    required String survivorId,
    required String matchId,
    required String teamId,
    required String gameweekId,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/survivor/pick"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "playerId": playerId,
        "survivorId": survivorId,
        "matchId": matchId,
        "teamId": teamId,
        "gameweekId": gameweekId,
      }),
    );

    print("Response body: ${response.body}");

    if (response.statusCode != 201) {
      print("Response body: ${response.body}");
      throw Exception(response.body);
    }
  }

  static Future<void> updateMatchScore({
    required String matchId,
    required int scoreHome,
    required int scoreVisitor,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/admin/update-match/$matchId"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "scoreHome": scoreHome,
        "scoreVisitor": scoreVisitor,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update match score");
    }
  }

  static Future<List<Map<String, dynamic>>> getLeaderboard(String survivorId) async {
    final response = await http.get(Uri.parse("$baseUrl/leaderboard/$survivorId"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body); // Esto es un Map
      final leaderboard = data['leaderboard'] as List<dynamic>;
      return leaderboard.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception("Failed to load leaderboard");
    }
  }

  static Future<Map<String, dynamic>> getPlayerSurvivorData(String survivorId, String playerId) async {
    final response = await http.get(Uri.parse("$baseUrl/survivor/$survivorId/player/$playerId"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to load player survivor data");
    }
  }

}