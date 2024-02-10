import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle get style18 => _getTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get styleBold18 => _getTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get style20 => _getTextStyle(
        fontSize: 20,
        color: Colors.black.withOpacity(0.8),
        fontWeight: FontWeight.w400,
      );

  static TextStyle get style22 => _getTextStyle(fontSize: 22);

  static TextStyle get style24 => _getTextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get style25 => _getTextStyle(fontSize: 25);

  static TextStyle _getTextStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w500,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: 'Inter',
      fontWeight: fontWeight,
      height: 0,
    );
  }
}
