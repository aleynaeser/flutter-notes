import 'package:flutter/material.dart';

// BuildContext için extension
extension ThemeExtensions on BuildContext {
  CustomThemeModel get themeColors =>
      Theme.of(this).extension<CustomThemeModel>()!;
}

@immutable
class CustomThemeModel extends ThemeExtension<CustomThemeModel> {
  final Color themeColor1;
  final Color themeColor2;
  const CustomThemeModel({
    required this.themeColor1,
    required this.themeColor2,
  });

  @override
  CustomThemeModel copyWith({Color? themeColor1, Color? themeColor2}) {
    return CustomThemeModel(
      themeColor1: themeColor1 ?? this.themeColor1,
      themeColor2: themeColor2 ?? this.themeColor2,
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
    );
  }
}
