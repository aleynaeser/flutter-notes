import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  CustomThemeModel get themeColors =>
      Theme.of(this).extension<CustomThemeModel>()!;
}

@immutable
class CustomThemeModel extends ThemeExtension<CustomThemeModel> {
  final Color themeColor1;
  final Color themeColor2;
  final Color themeColor3;
  final Color themeColor4;
  final Color themeColor5;
  const CustomThemeModel({
    required this.themeColor1,
    required this.themeColor2,
    required this.themeColor3,
    required this.themeColor4,
    required this.themeColor5,
  });

  @override
  CustomThemeModel copyWith({
    Color? themeColor1,
    Color? themeColor2,
    Color? themeColor3,
    Color? themeColor4,
    Color? themeColor5,
  }) {
    return CustomThemeModel(
      themeColor1: themeColor1 ?? this.themeColor1,
      themeColor2: themeColor2 ?? this.themeColor2,
      themeColor3: themeColor3 ?? this.themeColor3,
      themeColor4: themeColor4 ?? this.themeColor4,
      themeColor5: themeColor5 ?? this.themeColor5,
    );
  }

  @override
  CustomThemeModel lerp(ThemeExtension<CustomThemeModel>? other, double t) {
    if (other is! CustomThemeModel) {
      return this;
    }
    return CustomThemeModel(
      themeColor1: Color.lerp(themeColor1, other.themeColor1, t)!,
      themeColor2: Color.lerp(themeColor2, other.themeColor2, t)!,
      themeColor3: Color.lerp(themeColor3, other.themeColor3, t)!,
      themeColor4: Color.lerp(themeColor4, other.themeColor4, t)!,
      themeColor5: Color.lerp(themeColor5, other.themeColor5, t)!,
    );
  }
}
