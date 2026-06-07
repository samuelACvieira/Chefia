import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(

    primarySwatch: Colors.green,

    scaffoldBackgroundColor: Colors.white,

    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
    ),
  );
}