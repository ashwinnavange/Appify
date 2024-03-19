import 'package:appify/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomTextStyle{
  static TextStyle heading1({
    Color color = Colors.black,
    double? fontSize,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize ?? ScreenSize.h * 0.03,
      fontFamily: 'Inter-SemiBold',
    );
  }
  static TextStyle heading2({
    Color color = Colors.black,
    double? fontSize,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize ?? ScreenSize.h * 0.02,
      fontFamily: 'Inter-Medium',
      fontWeight: fontWeight,
    );
  }
  static TextStyle heading3({
    Color color = const Color.fromARGB(255, 59, 56, 53),
    double? fontSize,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize ?? ScreenSize.h * 0.015,
      fontFamily: 'Inter-Regular',
      fontWeight: fontWeight,
    );
  }
}