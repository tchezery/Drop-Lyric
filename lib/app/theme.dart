import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2563EB);
  static const Color secondaryColor = Color(0xFF7C3AED);
  static const Color backgroundColor = Color(0xFFF8FAFC);

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    scaffoldBackgroundColor: backgroundColor,
    useMaterial3: true,
  );
}
