import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

// ============================================================
//  ShipX Design System - Light Theme
// ============================================================

ThemeData lightThemeData() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ShipXColors.primary,
      onPrimary: ShipXColors.white,
      secondary: ShipXColors.title,
      onSecondary: ShipXColors.white,
      secondaryContainer: ShipXColors.bg2,
      onSecondaryContainer: ShipXColors.title,
      error: ShipXColors.red,
      onError: ShipXColors.white,
      errorContainer: Color(0xFFFFEDED),
      onErrorContainer: Color(0xFF7F1D1D),
      surface: ShipXColors.bg1,
      onSurface: ShipXColors.title,
      surfaceContainerHighest: ShipXColors.bg2,
      onSurfaceVariant: ShipXColors.body,
      outline: ShipXColors.border,
      outlineVariant: Color(0xFFF1F5F9),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: ShipXColors.title,
      onInverseSurface: ShipXColors.white,
    ),
    scaffoldBackgroundColor: ShipXColors.background,
    dividerColor: ShipXColors.border,
    dividerTheme: const DividerThemeData(
      color: ShipXColors.border,
      thickness: 1,
      space: 1,
    ),

    // ── AppBar ──────────────────────────
    appBarTheme: AppBarTheme(
      backgroundColor: ShipXColors.white,
      foregroundColor: ShipXColors.title,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: ShipXTextStyles.heading6,
      centerTitle: false,
    ),

    // ── Card ────────────────────────────
    cardTheme: CardThemeData(
      color: ShipXColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: ShipXRadius.lgAll,
        side: const BorderSide(color: ShipXColors.border),
      ),
      margin: EdgeInsets.zero,
    ),

    // ── ElevatedButton ──────────────────
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ShipXColors.primary,
        foregroundColor: ShipXColors.white,
        elevation: 0,
        textStyle: ShipXTextStyles.body5,
        padding: const EdgeInsets.symmetric(
          horizontal: ShipXSpacing.buttonPaddingH,
          vertical: ShipXSpacing.buttonPaddingV,
        ),
        shape: RoundedRectangleBorder(borderRadius: ShipXRadius.smAll),
      ),
    ),

    // ── OutlinedButton ──────────────────
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ShipXColors.primary,
        side: const BorderSide(color: ShipXColors.primary),
        textStyle: ShipXTextStyles.body5,
        padding: const EdgeInsets.symmetric(
          horizontal: ShipXSpacing.buttonPaddingH,
          vertical: ShipXSpacing.buttonPaddingV,
        ),
        shape: RoundedRectangleBorder(borderRadius: ShipXRadius.smAll),
      ),
    ),

    // ── TextButton ──────────────────────
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ShipXColors.primary,
        textStyle: ShipXTextStyles.body5,
        padding: const EdgeInsets.symmetric(
          horizontal: ShipXSpacing.sm,
          vertical: ShipXSpacing.xs,
        ),
      ),
    ),

    // ── InputDecoration ─────────────────
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ShipXColors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: ShipXSpacing.base,
        vertical: ShipXSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: ShipXRadius.smAll,
        borderSide: const BorderSide(color: ShipXColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: ShipXRadius.smAll,
        borderSide: const BorderSide(color: ShipXColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: ShipXRadius.smAll,
        borderSide: const BorderSide(color: ShipXColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: ShipXRadius.smAll,
        borderSide: const BorderSide(color: ShipXColors.red),
      ),
      hintStyle: ShipXTextStyles.body3.copyWith(color: const Color(0xFFCBD5E1)),
      labelStyle: ShipXTextStyles.body6,
      errorStyle: ShipXTextStyles.small1.copyWith(color: ShipXColors.red),
    ),

    // ── Chip ─────────────────────────────
    chipTheme: ChipThemeData(
      backgroundColor: ShipXColors.bg2,
      labelStyle: ShipXTextStyles.body6,
      side: const BorderSide(color: ShipXColors.border),
      shape: RoundedRectangleBorder(borderRadius: ShipXRadius.fullAll),
      padding: const EdgeInsets.symmetric(
        horizontal: ShipXSpacing.sm,
        vertical: ShipXSpacing.xs2,
      ),
    ),

    // ── BottomNavigationBar ──────────────
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ShipXColors.white,
      selectedItemColor: ShipXColors.primary,
      unselectedItemColor: ShipXColors.body,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
    ),

    // ── ListTile ─────────────────────────
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(
        horizontal: ShipXSpacing.base,
        vertical: ShipXSpacing.xs,
      ),
      iconColor: ShipXColors.body,
      textColor: ShipXColors.title,
    ),

    // ── SnackBar ─────────────────────────
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ShipXColors.title,
      contentTextStyle: ShipXTextStyles.body4.copyWith(
        color: ShipXColors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: ShipXRadius.smAll),
      behavior: SnackBarBehavior.floating,
    ),

    // ── Dialog ───────────────────────────
    dialogTheme: DialogThemeData(
      backgroundColor: ShipXColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: ShipXRadius.xlAll),
      titleTextStyle: ShipXTextStyles.heading6,
      contentTextStyle: ShipXTextStyles.body3,
    ),

    extensions: const [AppColorScheme.light],
  );
}
