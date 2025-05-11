import 'package:flutter/material.dart';

class AppThemeColors {
  final Color themeColor1;
  final Color themeColor2;

  const AppThemeColors({required this.themeColor1, required this.themeColor2});
}

extension ThemeColorsExtension on BuildContext {
  AppThemeColors get themeColors {
    return AppThemeColors(themeColor1: Colors.blue, themeColor2: Colors.grey);
  }
}
