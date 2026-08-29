import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2563EB);
  static const Color secondaryColor = Color(0xFF7C3AED);
  static const Color backgroundColor = Color(0xFFF8FAFC);

  // Dock & Glassmorphism Colors
  static const Color dockLightBackground = Color(0xB8FFFFFF); // 72% opacity white
  static const Color dockDarkBackground = Color(0xA61E1E2E);  // 65% opacity dark surface
  static const Color dockLightBorder = Color(0xB3FFFFFF);     // 70% opacity white border
  static const Color dockDarkBorder = Color(0x1FFFFFFF);      // 12% opacity white border
  static const Color dockShadowLight = Color(0x241E293B);     // 14% opacity slate shadow
  static const Color dockShadowDark = Color(0x66000000);      // 40% opacity black shadow
  static const Color unselectedIconLight = Color(0xFF475569);  // Slate 600
  static const Color unselectedIconDark = Color(0xB3FFFFFF);   // 70% white

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: backgroundColor,
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF0F172A),
    useMaterial3: true,
  );
}

