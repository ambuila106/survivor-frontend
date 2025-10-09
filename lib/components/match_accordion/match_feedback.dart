import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> showConfirmationDialog(BuildContext context) async {
  return await showDialog<bool>(
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
      ) ??
      false;
}

Future<bool> showJoinDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Unirse al Survivor'),
          content: const Text(
              'Aún no participas en este survivor. ¿Deseas unirte para poder hacer apuestas?'),
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
      ) ??
      false;
}

void showSuccessToast(String msg) => Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.greenAccent.shade700,
      textColor: Colors.white,
    );

void showErrorToast(String msg) => Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
    );
