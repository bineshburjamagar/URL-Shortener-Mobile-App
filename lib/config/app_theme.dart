import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 246, 246),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
    ),
  );
}
