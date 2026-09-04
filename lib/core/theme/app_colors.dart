import 'package:flutter/material.dart';

class ShipXColors {
  ShipXColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ── Light Theme Tokens ────────────────
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color bg1Light = Color(0xffF6F6F6);
  static const Color bg2Light = Color(0xFFFDF1F2);
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color titleLight = Color(0xFF0F172A);
  static const Color bodyLight = Color(0xFF475569);

  // ── Dark Theme Tokens ─────────────────
  static const Color backgroundDark = Color(0xFFFFFFFF);
  static const Color bg1Dark =Color(0xffF6F6F6);
  static const Color placeholderLight = Color(0xFFC4C4C4);
  static const Color bg2Dark = Color(0xFFFDF1F2);
  static const Color borderDark = Color(0xFFE2E8F0);
  static const Color titleDark = Color(0xFF0F172A);
  static const Color bodyDark = Color(0xFF475569);

  // ── Brand / Semantic ──────────────────
  static const Color primary = Color(0xFFD61721);
  static const Color deepBlue = Color(0xFF0F47B2);
  static const Color green = Color(0xFF3B9D53);
  static const Color teal = Color(0xFF27C09B);
  static const Color blue = Color(0xFF144BB8);
  static const Color red = Color(0xFFF62527);
  
  static const Color success = green;
  static const Color error = red;

  // ── Legacy Aliases (Default to Light) ──
  static const Color background = backgroundLight;
  static const Color bg1 = bg1Light;
  static const Color bg2 = bg2Light;
  static const Color border = borderLight;
  static const Color title = titleLight;
  static const Color body = bodyLight;
}

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color elevatedSurface;
  final Color appBar;
  final Color border;
  final Color outline;
  final Color divider;
  final Color textPrimary;
  final Color textSecondary;
  final Color textHint;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color overlay;
  final Color scrim;
  final LinearGradient primaryGradient;

  const AppColorScheme({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.elevatedSurface,
    required this.appBar,
    required this.border,
    required this.outline,
    required this.divider,
    required this.textPrimary,
    required this.textSecondary,
    required this.textHint,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.overlay,
    required this.scrim,
    required this.primaryGradient,
  });

  static const AppColorScheme light = AppColorScheme(
    primary: ShipXColors.primary,
    secondary: ShipXColors.titleLight,
    background: ShipXColors.backgroundLight,
    surface: ShipXColors.bg1Light,
    surfaceVariant: ShipXColors.bg2Light,
    elevatedSurface: ShipXColors.white,
    appBar: ShipXColors.white,
    border: ShipXColors.borderLight,
    outline: ShipXColors.borderLight,
    divider: ShipXColors.borderLight,
    textPrimary: ShipXColors.titleLight,
    textSecondary: ShipXColors.bodyLight,
    textHint: Color(0xFFCBD5E1),
    success: ShipXColors.green,
    warning: Color(0xFFF59E0B),
    error: ShipXColors.red,
    info: ShipXColors.primary,
    overlay: Color(0x1A0057FF),
    scrim: Color(0x80000000),
    primaryGradient: LinearGradient(
      colors: [ShipXColors.primary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static const AppColorScheme dark = AppColorScheme(
    primary: ShipXColors.primary,
    secondary: ShipXColors.titleDark,
    background: ShipXColors.backgroundDark,
    surface: ShipXColors.bg1Dark,
    surfaceVariant: ShipXColors.bg2Dark,
    elevatedSurface: Color(0xFF1E293B),
    appBar: Color(0xFF0F172A),
    border: ShipXColors.borderDark,
    outline: ShipXColors.borderDark,
    divider: ShipXColors.borderDark,
    textPrimary: ShipXColors.titleDark,
    textSecondary: ShipXColors.bodyDark,
    textHint: Color(0xFF64748B),
    success: ShipXColors.green,
    warning: Color(0xFFF59E0B),
    error: ShipXColors.red,
    info: ShipXColors.primary,
    overlay: Color(0x1A0057FF),
    scrim: Color(0xB3000000),
    primaryGradient: LinearGradient(
      colors: [ShipXColors.primary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  @override
  AppColorScheme copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? elevatedSurface,
    Color? appBar,
    Color? border,
    Color? outline,
    Color? divider,
    Color? textPrimary,
    Color? textSecondary,
    Color? textHint,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? overlay,
    Color? scrim,
    LinearGradient? primaryGradient,
  }) {
    return AppColorScheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      elevatedSurface: elevatedSurface ?? this.elevatedSurface,
      appBar: appBar ?? this.appBar,
      border: border ?? this.border,
      outline: outline ?? this.outline,
      divider: divider ?? this.divider,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textHint: textHint ?? this.textHint,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      overlay: overlay ?? this.overlay,
      scrim: scrim ?? this.scrim,
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }

  @override
  AppColorScheme lerp(AppColorScheme? other, double t) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      elevatedSurface: Color.lerp(elevatedSurface, other.elevatedSurface, t)!,
      appBar: Color.lerp(appBar, other.appBar, t)!,
      border: Color.lerp(border, other.border, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textHint: Color.lerp(textHint, other.textHint, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      overlay: Color.lerp(overlay, other.overlay, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      primaryGradient: t < 0.5 ? primaryGradient : other.primaryGradient,
    );
  }
}

extension AppColorSchemeContext on BuildContext {
  AppColorScheme get appColors =>
      Theme.of(this).extension<AppColorScheme>() ??
      (Theme.of(this).brightness == Brightness.dark
          ? AppColorScheme.dark
          : AppColorScheme.light);
}
