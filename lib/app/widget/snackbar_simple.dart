import 'package:flutter/material.dart';

/// Simple Snackbar Widget
/// That can be used anywhere
/// As long as you have the context
class SnackbarSimple {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
        elevation: 6,
        showCloseIcon: true,
        closeIconColor: Colors.white,
      ),
    );
  }
}
