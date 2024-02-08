import 'package:flutter/material.dart';
import 'package:flutter_poc/core/ui/styles/app_colors.dart';
import 'package:flutter_poc/core/util/color_helper.dart';

class TextStyles {
  static TextStyle largeTitle1 = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26);

  static TextStyle largeTitle2 = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24);

  static TextStyle title1 = const TextStyle(
      fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold);

  static TextStyle title2 = const TextStyle(
      fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold);

  static TextStyle title2Black = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle titleBlack1 = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle subtitleStyle = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle subtitleStyleBlack1 = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle forgotPasswordTextStyle =  TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: ColorUtils.parse(AppColors.buttonBlue),
  );

  static TextStyle profileCleaningHoursStyle = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);

  static TextStyle hintTextStyle =
      TextStyle(color: Colors.grey.withOpacity(0.5));

  static TextStyle timeAgoStyle =
      const TextStyle(color: Colors.grey, fontSize: 12);

  static TextStyle passwordTypeHintStyle = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );

  static TextStyle startStopButtonStyle(bool canStop) => const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
}
