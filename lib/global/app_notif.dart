import 'package:flutter/material.dart';

class AppNotif {
  static void showSnackBarCustom(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
            label: "Close",
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
      ),
    );
  }
}
