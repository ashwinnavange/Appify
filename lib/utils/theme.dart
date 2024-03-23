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

  static TextStyle heading025({
    Color color = Colors.black,
    double? fontSize,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize ?? ScreenSize.h * 0.025,
      fontFamily: 'Inter-SemiBold',
    );
  }
  static TextStyle heading02({
    Color color = Colors.black,
    double? fontSize,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize ?? ScreenSize.h * 0.019,
      fontFamily: 'Inter-Medium',
      fontWeight: fontWeight,
    );
  }

  static TextStyle heading017({
    Color color = const Color.fromARGB(255, 59, 56, 53),
    double? fontSize,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize ?? ScreenSize.h * 0.017,
      fontFamily: 'Inter-Regular',
      fontWeight: fontWeight,
    );
  }

  static TextStyle headingU1(double fs, {Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: ScreenSize.h * fs / 100,
      fontFamily: 'Inter-SemiBold',
    );
  }
}

class CTS{
  static TextStyle h1(double fs, {Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: fs,
      fontFamily: 'Inter-SemiBold',
    );
  }
  static TextStyle h2(double fs, {Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: fs,
      fontFamily: 'Inter-Medium',
    );
  }
  static TextStyle h3(double fs, {Color color = const Color.fromARGB(255, 59, 56, 53)}) {
    return TextStyle(
      color: color,
      fontSize: fs,
      fontFamily: 'Inter-Regular',
    );
  }
}