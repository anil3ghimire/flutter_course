import 'package:flutter/material.dart';

import 'app_spacing.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      color: Colors.amber,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(fontSize: AppSpacing.medium, color: Colors.red),
    headlineSmall: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(fontSize: AppSpacing.medium, color: Colors.red),
    headlineSmall: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent),
  );
}
