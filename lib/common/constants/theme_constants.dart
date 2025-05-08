import 'package:flutter/material.dart';

class ThemeColors {
  final Color themeColor1;
  final Color themeColor2;

  const ThemeColors._({required this.themeColor1, required this.themeColor2});

  static const light = ThemeColors._(
    themeColor1: Colors.white,
    themeColor2: Color(0xFFF5F5F5),
  );

  static const dark = ThemeColors._(
    themeColor1: Color(0xFF252525),
    themeColor2: Color(0xFF3A3A3A),
  );
}
