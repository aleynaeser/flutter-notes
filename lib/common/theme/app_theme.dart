import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/common/theme/data/colors_data.dart';
import 'package:todo_app/common/theme/models/custom_colors_model.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.darkThemeColor1,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkThemeColor1,
      secondary: AppColors.darkThemeColor2,
      surface: AppColors.darkThemeColor3,
      background: AppColors.darkThemeColor1,
    ),
    extensions: [
      CustomColorsModel(
        buttonColor: AppColors.darkButtonColor,
        cardColor: AppColors.darkCardColor,
        borderColor: AppColors.darkBorderColor,
      ),
    ],
  );

  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.lightThemeColor1,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightThemeColor1,
      secondary: AppColors.lightThemeColor2,
      surface: AppColors.lightThemeColor3,
      background: AppColors.lightThemeColor1,
    ),
    extensions: [
      CustomColorsModel(
        buttonColor: AppColors.lightButtonColor,
        cardColor: AppColors.lightCardColor,
        borderColor: AppColors.lightBorderColor,
      ),
    ],
  );
}
