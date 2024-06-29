import 'package:flutter/material.dart';
import 'styles.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  ThemeData get currentTheme =>
      _isDarkModeEnabled ? AppThemes.darkTheme : AppThemes.lightTheme;

  void toggleDarkMode(bool value) {
    _isDarkModeEnabled = value;
    notifyListeners();
  }
}
