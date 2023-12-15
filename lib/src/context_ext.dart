import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// Get X percent of Height of a screen
  double h(num percent) => percent * MediaQuery.of(this).size.height / 100;

  /// Get X percent of Width of a screen
  double w(num percent) => percent * MediaQuery.of(this).size.width / 100;

  /// Indicates whether the app is in dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Indicates whether the app is in light mode
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;
}
