import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class ShipXTextStyles {
  ShipXTextStyles._();

  // ── Heading Scale ─────────────────────
  // Heading 1 — Hero / Page titles
  static TextStyle heading1 = GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.5,
    color: ShipXColors.title,
  );

  // Heading 2
  static TextStyle heading2 = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: -0.4,
    color: ShipXColors.title,
  );

  // Heading 3
  static TextStyle heading3 = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.3,
    color: ShipXColors.title,
  );

  // Heading 4
  static TextStyle heading4 = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: -0.2,
    color: ShipXColors.title,
  );

  // Heading 5
  static TextStyle heading5 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: -0.1,
    color: ShipXColors.title,
  );

  // Heading 6
  static TextStyle heading6 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
    color: ShipXColors.title,
  );

  // Heading 7
  static TextStyle heading7 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.44,
    letterSpacing: 0,
    color: ShipXColors.title,
  );

  // Heading 8
  static TextStyle heading8 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
    color: ShipXColors.title,
  );

  // ── Title Scale ───────────────────────
  // Title 1 — Section labels, card headers
  static TextStyle title1 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
    color: ShipXColors.title,
  );

  // Title 2
  static TextStyle title2 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.44,
    letterSpacing: 0,
    color: ShipXColors.title,
  );

  // Title 3 — Medium weight variant
  static TextStyle title3 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0,
    color: ShipXColors.title,
  );

  // Title 4
  static TextStyle title4 = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
    color: ShipXColors.title,
  );

  // Title 5 — Medium
  static TextStyle title5 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.57,
    letterSpacing: 0,
    color: ShipXColors.title,
  );

  // Title 6 — Offer / Price
  static TextStyle title6OfferPrice = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.54,
    letterSpacing: 0,
    color: ShipXColors.primary,
    decoration: TextDecoration.lineThrough,
  );

  // ── Body Scale ────────────────────────
  // Body 1 — Semibold emphasis
  static TextStyle body1 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
    color: ShipXColors.body,
  );

  // Body 2 — Medium
  static TextStyle body2 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0,
    color: ShipXColors.body,
  );

  // Body 3 — Regular (primary reading text)
  static TextStyle body3 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
    color: ShipXColors.body,
  );

  // Body 4 — Regular small
  static TextStyle body4 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.57,
    letterSpacing: 0,
    color: ShipXColors.body,
  );

  // Body 5 — Semibold small
  static TextStyle body5 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.57,
    letterSpacing: 0,
    color: ShipXColors.body,
  );

  // Body 6 — Medium small
  static TextStyle body6 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.57,
    letterSpacing: 0,
    color: ShipXColors.body,
  );

  // Body 7 — Medium italic
  static TextStyle body7Italic = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    height: 1.57,
    letterSpacing: 0,
    color: ShipXColors.body,
  );

  // Body 8 — Regular XS
  static TextStyle body8 = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.54,
    letterSpacing: 0,
    color: ShipXColors.body,
  );

  // Body 9 — Regular XXS
  static TextStyle body9 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
    color: ShipXColors.body,
  );

  // ── Small / Caption Scale ─────────────
  static TextStyle small1 = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.45,
    letterSpacing: 0.2,
    color: ShipXColors.body,
  );

  // ── Helper: apply custom color ────────
  static TextStyle withColor(TextStyle style, Color color) =>
      style.copyWith(color: color);
}

// ─────────────────────────────────────────
//  2. SPACING & SIZING TOKENS
// ─────────────────────────────────────────

class ShipXSpacing {
  ShipXSpacing._();

  static const double xs2 = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double base = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xl2 = 32;
  static const double xl3 = 40;
  static const double xl4 = 48;
  static const double xl5 = 56;
  static const double xl6 = 64;

  // Common component-specific
  static const double buttonPaddingV = 12;
  static const double buttonPaddingH = 20;
  static const double cardPadding = 16;
  static const double pagePadding = 20;
  static const double sectionGap = 32;
}

// ─────────────────────────────────────────
//  3. BORDER RADIUS TOKENS
// ─────────────────────────────────────────

class ShipXRadius {
  ShipXRadius._();

  static const double none = 0;
  static const double xs = 4;
  static const double sm = 6;
  static const double md = 8;
  static const double lg = 12;
  static const double xl = 16;
  static const double xl2 = 20;
  static const double full = 999;

  static BorderRadius get xsAll => BorderRadius.circular(xs);

  static BorderRadius get smAll => BorderRadius.circular(sm);

  static BorderRadius get mdAll => BorderRadius.circular(md);

  static BorderRadius get lgAll => BorderRadius.circular(lg);

  static BorderRadius get xlAll => BorderRadius.circular(xl);

  static BorderRadius get fullAll => BorderRadius.circular(full);
}

// ─────────────────────────────────────────
//  4. ELEVATION / SHADOW TOKENS
// ─────────────────────────────────────────

class ShipXShadows {
  ShipXShadows._();

  static const List<BoxShadow> none = [];

  static const List<BoxShadow> sm = [
    BoxShadow(color: Color(0x0A000000), blurRadius: 4, offset: Offset(0, 1)),
  ];

  static const List<BoxShadow> md = [
    BoxShadow(color: Color(0x0F000000), blurRadius: 8, offset: Offset(0, 2)),
    BoxShadow(color: Color(0x06000000), blurRadius: 4, offset: Offset(0, 1)),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, 4)),
    BoxShadow(color: Color(0x08000000), blurRadius: 8, offset: Offset(0, 2)),
  ];

  static const List<BoxShadow> xl = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 32, offset: Offset(0, 8)),
    BoxShadow(color: Color(0x0A000000), blurRadius: 16, offset: Offset(0, 4)),
  ];
}

// ─────────────────────────────────────────
//  5. REUSABLE COMPONENT TOKENS
// ─────────────────────────────────────────

/// Badge / Tag variants
enum ShipXBadgeVariant { primary, success, error, neutral }

extension ShipXBadgeVariantX on ShipXBadgeVariant {
  Color get background => switch (this) {
    ShipXBadgeVariant.primary => ShipXColors.primary,
    ShipXBadgeVariant.success => const Color(0xFFDCFCE7),
    ShipXBadgeVariant.error => const Color(0xFFFFEDED),
    ShipXBadgeVariant.neutral => ShipXColors.bg2,
  };

  Color get foreground => switch (this) {
    ShipXBadgeVariant.primary => ShipXColors.primary,
    ShipXBadgeVariant.success => const Color(0xFF15803D),
    ShipXBadgeVariant.error => ShipXColors.red,
    ShipXBadgeVariant.neutral => ShipXColors.body,
  };
}

/// Button size variants
enum ShipXButtonSize { sm, md, lg }

extension ShipXButtonSizeX on ShipXButtonSize {
  EdgeInsets get padding => switch (this) {
    ShipXButtonSize.sm => const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 7,
    ),
    ShipXButtonSize.md => const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 11,
    ),
    ShipXButtonSize.lg => const EdgeInsets.symmetric(
      horizontal: 28,
      vertical: 15,
    ),
  };

  TextStyle get textStyle => switch (this) {
    ShipXButtonSize.sm => ShipXTextStyles.body6,
    ShipXButtonSize.md => ShipXTextStyles.body5,
    ShipXButtonSize.lg => ShipXTextStyles.body1,
  };

  double get iconSize => switch (this) {
    ShipXButtonSize.sm => 14,
    ShipXButtonSize.md => 16,
    ShipXButtonSize.lg => 20,
  };
}

// ─────────────────────────────────────────
//  6. DESIGN TOKENS MAP  (for reference)
// ─────────────────────────────────────────

/// Quick token lookup — useful for dynamic theming or code generation.
class ShipXTokens {
  ShipXTokens._();

  static const Map<String, Color> colors = {
    'white': ShipXColors.white,
    'primary': ShipXColors.primary,
    'title': ShipXColors.title,
    'body': ShipXColors.body,
    'border': ShipXColors.border,
    'bg1': ShipXColors.bg1,
    'bg2': ShipXColors.bg2,
    'green': ShipXColors.green,
    'red': ShipXColors.red,
  };

  static const Map<String, double> spacing = {
    'xs2': ShipXSpacing.xs2,
    'xs': ShipXSpacing.xs,
    'sm': ShipXSpacing.sm,
    'md': ShipXSpacing.md,
    'base': ShipXSpacing.base,
    'lg': ShipXSpacing.lg,
    'xl': ShipXSpacing.xl,
    'xl2': ShipXSpacing.xl2,
    'xl3': ShipXSpacing.xl3,
    'xl4': ShipXSpacing.xl4,
  };

  static const Map<String, double> radius = {
    'none': ShipXRadius.none,
    'xs': ShipXRadius.xs,
    'sm': ShipXRadius.sm,
    'md': ShipXRadius.md,
    'lg': ShipXRadius.lg,
    'xl': ShipXRadius.xl,
    'xl2': ShipXRadius.xl2,
    'full': ShipXRadius.full,
  };
}
