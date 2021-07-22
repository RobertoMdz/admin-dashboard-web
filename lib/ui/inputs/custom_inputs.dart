import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.7),
        ),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: Colors.white.withOpacity(0.6),
      ),
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
      ),
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
      ),
    );
  }
}