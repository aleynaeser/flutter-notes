import 'package:flutter/material.dart';

class ThemeColors {
  final Color themeColor1;
  final Color themeColor2;
  final Color themeColor3;
  final Color themeColor4;
  final Color themeColor5;

  const ThemeColors._({
    required this.themeColor1,
    required this.themeColor2,
    required this.themeColor3,
    required this.themeColor4,
    required this.themeColor5,
  });

  static const light = ThemeColors._(
    themeColor1: Color(0xFFF5F5F5),
    themeColor2: Color(0xFFE1E0E0),
    themeColor3: Color(0xFFC99CDB),
    themeColor4: Color(0xFF252525),
    themeColor5: Color(0xFF7C7C7C),
  );

  static const dark = ThemeColors._(
    themeColor1: Color(0xFF252525),
    themeColor2: Color(0xFF3A3A3A),
    themeColor3: Color(0xFFC99CDB),
    themeColor4: Color(0xFFF1F1F1),
    themeColor5: Color(0xFF7C7C7C),
  );
}
