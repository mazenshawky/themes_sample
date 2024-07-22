import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

String themeSelectionKey = 'THEME_SELECTION_KEY';
String isDarkModeKey = 'IS_DARK_MODE_KEY';

class AppTheme extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  AppTheme({required this.sharedPreferences});

  static ThemeData getLightTheme() {
    return ThemeData(useMaterial3: true);
  }

  static ThemeData getDarkTheme() {
    return ThemeData.dark(useMaterial3: true);
  }

  bool isDarkMode() {
    final themeMode = getThemeMode();
    switch (themeMode) {
      case ThemeMode.system:
        return _isSystemDarkMode();
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
    }
  }

  ThemeMode getThemeMode() {
    final isThemeSelected =
        sharedPreferences.getBool(themeSelectionKey) ?? false;

    if (isThemeSelected) {
      final isDarkMode = sharedPreferences.getBool(isDarkModeKey) ?? false;
      return isDarkMode ? ThemeMode.dark : ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }

  bool _isSystemDarkMode() {
    final Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode;
  }

  void setTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        sharedPreferences.remove(themeSelectionKey);
        sharedPreferences.remove(isDarkModeKey);
      case ThemeMode.light:
        sharedPreferences.setBool(themeSelectionKey, true);
        sharedPreferences.setBool(isDarkModeKey, false);
      case ThemeMode.dark:
        sharedPreferences.setBool(themeSelectionKey, true);
        sharedPreferences.setBool(isDarkModeKey, true);
    }
    notifyListeners();
  }
}
