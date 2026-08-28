import 'package:flutter/material.dart';
import 'app_size_class.dart';

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension ContextExtension on BuildContext {
  /// Quick access to screen height.
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Quick access to screen width.
  double get screenWidth => MediaQuery.sizeOf(this).width;

  AppSizeClass get sz => AppSizeClass.instance;

  /// Quick access to the global theme data.
  ThemeData get theme => Theme.of(this);

  /// Quick access to text theme.
  TextTheme get textTheme => Theme.of(this).textTheme;
}
