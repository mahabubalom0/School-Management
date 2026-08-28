import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

// ============================================================
//  ShipX Design System - Dark Theme (Minimal Implementation)
// ============================================================

ThemeData darkThemeData() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ShipXColors.primary,
      brightness: Brightness.dark,
      primary: ShipXColors.primary,
      onPrimary: ShipXColors.white,
      surface: const Color(0xFF0F172A),
      onSurface: ShipXColors.white,
    ),
    scaffoldBackgroundColor: ShipXColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: ShipXColors.bg1,
      foregroundColor: ShipXColors.white,
      elevation: 0,
      titleTextStyle: ShipXTextStyles.heading6,
    ),

    extensions: const [AppColorScheme.dark],
  );
}
