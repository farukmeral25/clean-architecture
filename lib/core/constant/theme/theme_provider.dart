import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late bool themeData = false;
  ThemeMode themeMode = ThemeMode.light;

  toggleTheme(bool theme) {
    themeData = theme;
    if (theme) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
