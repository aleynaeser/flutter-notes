import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/common/constants/index.dart';
import 'package:todo_app/common/models/theme_model.dart';

class ThemeConfig {
  static ThemeData getTheme(bool isDarkMode) {
    final (baseTheme, colorScheme, themeColors) = _getThemeData(isDarkMode);

    return baseTheme.copyWith(
      scaffoldBackgroundColor: themeColors.themeColor1,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 6,
        backgroundColor: themeColors.themeColor2,
        foregroundColor: themeColors.themeColor3,
        sizeConstraints: const BoxConstraints(minWidth: 46, minHeight: 46),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.buttonRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: themeColors.themeColor2,
          foregroundColor: themeColors.themeColor3,
          minimumSize: const Size(Sizes.buttonWidth, Sizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.buttonRadius),
          ),
        ),
      ),
      // colorScheme: colorScheme.copyWith(),
      extensions: [
        CustomThemeModel(
          themeColor1: themeColors.themeColor1,
          themeColor2: themeColors.themeColor2,
          themeColor3: themeColors.themeColor3,
          themeColor4: themeColors.themeColor4,
          themeColor5: themeColors.themeColor5,
        ),
      ],
    );
  }

  static (ThemeData, ColorScheme, ThemeColors) _getThemeData(bool isDarkMode) =>
      isDarkMode
          ? (ThemeData.dark(), ColorScheme.dark(), ThemeColors.dark)
          : (ThemeData.light(), ColorScheme.light(), ThemeColors.light);
}
