import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get darkMode => Theme.of(this).brightness == Brightness.dark;
}
