import 'package:flutter/material.dart';

class AppTheme {
  static final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.amber),
    borderRadius: BorderRadius.circular(10.0),
  );
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 246, 246),
    inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
        errorBorder: _outlineInputBorder
          ..copyWith(borderSide: const BorderSide(color: Colors.red))),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.orange,
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
