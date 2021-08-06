import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
