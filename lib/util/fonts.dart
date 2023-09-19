import 'package:flutter/material.dart';

class Fonts {
  // Cabinet Grotesk font TextStyle
  static TextStyle cabinetGrotesk({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontFamily: 'Cabinet Grotesk',
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.white,
        decoration: decoration ?? TextDecoration.none,
        fontStyle: fontStyle ?? FontStyle.normal,
        height: height ?? 0.0,
        letterSpacing: letterSpacing ?? 0.0,
      );

  // Nunito font TextStyle
  static TextStyle nunito({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontFamily: 'Nunito',
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.white,
        decoration: decoration ?? TextDecoration.none,
        fontStyle: fontStyle ?? FontStyle.normal,
        height: height ?? 0.0,
        letterSpacing: letterSpacing ?? 0.0,
      );

  // Tropiline font TextStyle
  static TextStyle tropiline({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontFamily: 'Tropiline',
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.white,
        decoration: decoration ?? TextDecoration.none,
        fontStyle: fontStyle ?? FontStyle.normal,
        height: height ?? 0.0,
        letterSpacing: letterSpacing ?? 0.0,
      );
}
