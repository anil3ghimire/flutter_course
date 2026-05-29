import 'package:flutter/material.dart';

import 'app_radius.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'RobotoMono',
    colorScheme: .fromSeed(seedColor: Colors.blue),
    textTheme: AppTextTheme.lightTextTheme,
    cardTheme: CardThemeData(elevation: 10, color: Colors.yellow.shade50),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.redAccent),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple,

      centerTitle: true,
    ),
  );

  static ThemeData dartTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'RobotoMono',
    colorScheme: .fromSeed(seedColor: Colors.black),
    textTheme: AppTextTheme.darkTextTheme,
    cardTheme: CardThemeData(elevation: 23, color: Colors.yellow.shade50),
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.redAccent),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.medium),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple,

      centerTitle: true,
    ),
  );
}
