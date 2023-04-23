import 'package:akm/app/common/style.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: primaryColor, // customize the background color
        duration: const Duration(seconds: 2), // customize the duration
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),

        showCloseIcon: true,
        closeIconColor: Colors.white,
      ),
    );
  }
}

class CustomSnackBarPink {
  static show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.pink, // customize the background color
        duration: const Duration(seconds: 2), // customize the duration
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),

        showCloseIcon: true,
        closeIconColor: Colors.white,
      ),
    );
  }
}
