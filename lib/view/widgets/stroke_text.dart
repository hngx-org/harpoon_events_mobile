import 'dart:collection';

import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final double strokeWidth;
  final Color textColor;
  final Color strokeColor;
  final TextStyle? textStyle;
  final bool? softWrap;

  const StrokeText({
    Key? key,
    required this.text,
    this.strokeWidth = 1.5,
    this.strokeColor = Colors.black,
    this.textColor = const Color.fromRGBO(255, 242, 0, 1),
    this.textStyle,
    this.softWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap,
      style: TextStyle(
        color: textColor,
        shadows: Font.outlinedText(strokeWidth: strokeWidth),
        fontFamily: "Tropiline",
      ).merge(textStyle),
    );
  }
}

class Font {
  static List<Shadow> outlinedText(
      {required double strokeWidth,
      Color strokeColor = Colors.black,
      int precision = 2}) {
    Set<Shadow> result = HashSet();
    for (int x = 1; x < strokeWidth + precision; x++) {
      for (int y = 1; y < strokeWidth + precision; y++) {
        double offsetX = x.toDouble();
        double offsetY = y.toDouble();
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
      }
    }
    return result.toList();
  }
}
