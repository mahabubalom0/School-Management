import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Breakpoint definitions
enum ScreenType { mobile, tablet, desktop, tv }

/// Global helper functions for responsive sizing.
/// Call [AppSizeClass.init(context)] in your App's build method first.

double getHeight(double size) => AppSizeClass.instance.getHeight(size);
double getWidth(double size) => AppSizeClass.instance.getWidth(size);
double getSp(double size) => AppSizeClass.instance.getSp(size);
double getRadius(double size) => AppSizeClass.instance.getRadius(size);

T getValue<T>({
  required T mobile,
  T? tablet,
  T? desktop,
  T? tv,
}) =>
    AppSizeClass.instance.getValue(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      tv: tv,
    );

/// Global screen utility getters
double get sWidth => AppSizeClass.instance.screenWidth;
double get sHeight => AppSizeClass.instance.screenHeight;
double get hPadding => AppSizeClass.instance.horizontalPadding;
double get maxCWidth => AppSizeClass.instance.maxContentWidth;

bool get isMobile => AppSizeClass.instance.isMobile;
bool get isTablet => AppSizeClass.instance.isTablet;
bool get isDesktop => AppSizeClass.instance.isDesktop;
bool get isTV => AppSizeClass.instance.isTV;

/// A production-ready, globally accessible responsive helper.
class AppSizeClass {
  static AppSizeClass? _instance;

  final double screenWidth;
  final double screenHeight;
  final ScreenType screenType;
  final double scaleFactor;

  AppSizeClass._({
    required this.screenWidth,
    required this.screenHeight,
    required this.screenType,
    required this.scaleFactor,
  });

  /// The global singleton instance.
  static AppSizeClass get instance {
    assert(_instance != null, 'AppSizeClass must be initialized by calling AppSizeClass.init(context) in your App build method.');
    return _instance!;
  }

  /// Initialize the responsive system. 
  /// Should be called in the build method of your main App widget.
  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    final ScreenType type;
    final double scale;

    if (width < 600) {
      type = ScreenType.mobile;
      scale = (width / 375).clamp(0.8, 1.2);
    } else if (width < 1024) {
      type = ScreenType.tablet;
      scale = (width / 768).clamp(1.0, 1.4);
    } else if (width < 1440) {
      type = ScreenType.desktop;
      scale = (width / 1280).clamp(1.1, 1.6);
    } else {
      type = ScreenType.tv;
      scale = (width / 1920).clamp(1.4, 2.2);
    }

    _instance = AppSizeClass._(
      screenWidth: width,
      screenHeight: height,
      screenType: type,
      scaleFactor: scale,
    );
  }

  // ── Type checks ─────────────────────────────────────────────────────────────

  bool get isMobile => screenType == ScreenType.mobile;
  bool get isTablet => screenType == ScreenType.tablet;
  bool get isDesktop => screenType == ScreenType.desktop;
  bool get isTV => screenType == ScreenType.tv;
  bool get isLarge => screenWidth >= 600;

  // ── Responsive value methods ────────────────────────────────────────────────

  double getSp(double size) => size.sp;
  double getWidth(double size) => size.w;
  double getHeight(double size) => size.h;
  double getRadius(double size) => size.r;

  T getValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
    T? tv,
  }) {
    switch (screenType) {
      case ScreenType.tv:
        return tv ?? desktop ?? tablet ?? mobile;
      case ScreenType.desktop:
        return desktop ?? tablet ?? mobile;
      case ScreenType.tablet:
        return tablet ?? mobile;
      case ScreenType.mobile:
        return mobile;
    }
  }

  double get maxContentWidth {
    switch (screenType) {
      case ScreenType.mobile: return screenWidth;
      case ScreenType.tablet: return 720;
      case ScreenType.desktop: return 1024;
      case ScreenType.tv: return 1400;
    }
  }

  double get horizontalPadding => getValue<double>(
        mobile: 16,
        tablet: 32,
        desktop: 48,
        tv: 64,
      );
}
