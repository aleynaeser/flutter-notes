import 'package:flutter/material.dart';

@immutable
class CustomColorsModel extends ThemeExtension<CustomColorsModel> {
  final Color buttonColor;
  final Color cardColor;
  final Color borderColor;

  const CustomColorsModel({
    required this.buttonColor,
    required this.cardColor,
    required this.borderColor,
  });

  @override
  CustomColorsModel copyWith({
    Color? buttonColor,
    Color? cardColor,
    Color? borderColor,
  }) {
    return CustomColorsModel(
      buttonColor: buttonColor ?? this.buttonColor,
      cardColor: cardColor ?? this.cardColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  CustomColorsModel lerp(ThemeExtension<CustomColorsModel>? other, double t) {
    if (other is! CustomColorsModel) {
      return this;
    }
    return CustomColorsModel(
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }
}
