import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/api_service.dart';
import 'match_feedback.dart';

final Map<String, Map<String, String>> globalSelectedTeams = {};

class MatchSelectionController {
  final String playerId;
  final String survivorId;
  final String gameweekId;

  MatchSelectionController({
    required this.playerId,
    required this.survivorId,
    required this.gameweekId,
  });

  String? getSelectedTeam() => globalSelectedTeams[survivorId]?[gameweekId];

  void setSelectedTeam(String teamId) {
    globalSelectedTeams.putIfAbsent(survivorId, () => {});
    globalSelectedTeams[survivorId]![gameweekId] = teamId;
  }

  Future<bool> pickTeam(
    BuildContext context, {
    required String matchId,
    required String teamId,
  }) async {
    final confirmed = await showConfirmationDialog(context);
    if (!confirmed) return false;

    try {
      await ApiService.pickTeam(
        playerId: playerId,
        survivorId: survivorId,
        matchId: matchId,
        teamId: teamId,
        gameweekId: gameweekId,
      );

      setSelectedTeam(teamId);
      showSuccessToast("✅ Apuesta realizada correctamente");
      return true;
    } catch (e) {
      final errorMessage = e.toString();
      print('Error al seleccionar equipo: $errorMessage');

      if (errorMessage.contains('Player not part of survivor')) {
        final join = await showJoinDialog(context);
        if (join) {
          await _joinSurvivor();
        }
      } else {
        showErrorToast("❌ Error al seleccionar equipo");
      }
      return false;
    }
  }

  Future<void> _joinSurvivor() async {
    try {
      await ApiService.joinSurvivor(playerId, survivorId);
      showSuccessToast("🎉 Te has unido al Survivor exitosamente");
    } catch (err) {
      print('Error al unirse: $err');
      showErrorToast("❌ Error al unirse al Survivor");
    }
  }
}
