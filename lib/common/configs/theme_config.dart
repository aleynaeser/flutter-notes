import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/common/constants/theme_constants.dart';
import 'package:todo_app/common/models/theme_model.dart';

class ThemeConfig {
  static ThemeData getTheme(bool isDarkMode) {
    final (baseTheme, colorScheme, themeColors) = _getThemeData(isDarkMode);

    return baseTheme.copyWith(
      scaffoldBackgroundColor: themeColors.themeColor1,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      colorScheme: colorScheme.copyWith(
        primary: themeColors.themeColor1,
        secondary: themeColors.themeColor2,
      ),
      extensions: [
        CustomThemeModel(
          themeColor1: themeColors.themeColor1,
          themeColor2: themeColors.themeColor2,
        ),
      ],
    );
  }

  static (ThemeData, ColorScheme, ThemeColors) _getThemeData(bool isDarkMode) =>
      isDarkMode
          ? (ThemeData.dark(), ColorScheme.dark(), ThemeColors.dark)
          : (ThemeData.light(), ColorScheme.light(), ThemeColors.light);
}
