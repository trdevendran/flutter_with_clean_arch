import 'package:flutter/material.dart';
import 'package:flutter_poc/core/util/color_helper.dart';

import 'app_colors.dart';

class ButtonStyles {
  static ButtonStyle loginButtonStyle = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(
          ColorUtils.parse(AppColors.buttonBlue)));

  static final startButton = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))));

  static final stopButton = ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))));
}
