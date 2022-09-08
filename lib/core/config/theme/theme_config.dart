import 'package:flutter/material.dart';

class ThemeConfig extends ChangeNotifier {
  ThemeConfig._();

  static final ThemeConfig i = ThemeConfig._(); //Singleton

  bool _isDarkTheme = false;

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  bool get isDarkTheme => _isDarkTheme;
}
