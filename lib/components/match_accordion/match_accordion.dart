import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/api_service.dart';
import 'match_tile.dart';

// Estado global: survivorId → (gameweekId → teamId)
final Map<String, Map<String, String>> globalSelectedTeams = {};

class MatchAccordion extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> matches;
  final String survivorId;
  final String playerId;
  final String gameweekId;

  const MatchAccordion({
    super.key,
    required this.title,
    required this.matches,
    required this.survivorId,
    required this.playerId,
    required this.gameweekId,
  });

  @override
  State<MatchAccordion> createState() => _MatchAccordionState();
}

class _MatchAccordionState extends State<MatchAccordion> {
  String? selectedTeamId; // selección de esta jornada

  @override
  void initState() {
    super.initState();
    // Cargar la selección guardada globalmente si existe
    selectedTeamId = globalSelectedTeams[widget.survivorId]?[widget.gameweekId];
  }

void pickTeam({
  required String matchId,
  required String teamId,
}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Confirmar selección'),
      content: const Text('¿Estás seguro de que quieres cambiar tu apuesta?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Sí, continuar'),
        ),
      ],
    ),
  );

  if (confirmed != true) return;

  try {
    await ApiService.pickTeam(
      playerId: widget.playerId,
      survivorId: widget.survivorId,
      matchId: matchId,
      teamId: teamId,
      gameweekId: widget.gameweekId,
    );

    setState(() {
      selectedTeamId = teamId;
      globalSelectedTeams.putIfAbsent(widget.survivorId, () => {});
      globalSelectedTeams[widget.survivorId]![widget.gameweekId] = teamId;
    });

    Fluttertoast.showToast(
      msg: "✅ Apuesta realizada correctamente",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.greenAccent.shade700,
      textColor: Colors.white,
      fontSize: 16,
    );
  } catch (e) {
    final errorMessage = e.toString();
    print('Error al seleccionar equipo: $errorMessage');

    if (errorMessage.contains('Player not part of survivor')) {
      // No mostramos error, solo el diálogo para unirse
      final joinConfirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Unirse al Survivor'),
          content: const Text(
            'Aún no participas en este survivor. ¿Deseas unirte para poder hacer apuestas?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Sí, unirme'),
            ),
          ],
        ),
      );

      if (joinConfirmed == true) {
        try {
          await ApiService.joinSurvivor(widget.playerId, widget.survivorId);

          Fluttertoast.showToast(
            msg: "🎉 Te has unido al Survivor exitosamente",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16,
          );
        } catch (err) {
          print('Error al unirse: $err');
          Fluttertoast.showToast(
            msg: "❌ Error al unirse al Survivor",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 16,
          );
        }
      }
    } else {
      // Solo otros errores sí muestran toast rojo
      Fluttertoast.showToast(
        msg: "❌ Error al seleccionar equipo",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16,
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[900]!.withOpacity(0.6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpansionTile(
          collapsedIconColor: Colors.white70,
          iconColor: Colors.white70,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          children: widget.matches.map((match) {
            return MatchTile(
              match: match,
              selectedTeamId: selectedTeamId,
              onSelectTeam: (teamId) {
                pickTeam(matchId: match['_id'], teamId: teamId);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
