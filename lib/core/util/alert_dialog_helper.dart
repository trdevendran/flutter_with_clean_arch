import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlertDialogHelper {
  static Future<dynamic> showAlert(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => context.pop(), child: const Text("Okay"))
              ],
            ));
  }
}
