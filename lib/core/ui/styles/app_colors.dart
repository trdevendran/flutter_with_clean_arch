import 'package:flutter/material.dart';

import '../../util/color_helper.dart';

class AppColors {
  static const String profileBannerColor1 = "#0096FF";
  static const String profileBannerColor3 = "##FF9E53";
  static const String sliderTrack = "#0064E3";
  static const String buttonBlue = "#00ABFF";
  static var profileNameColors = [
    ColorUtils.parse('009AFF'),
    Colors.pink,
    Colors.orange
  ];
  static var profileBannerColors = [
    ColorUtils.parse(AppColors.profileBannerColor1),
    Colors.pink,
    ColorUtils.parse(AppColors.profileBannerColor3),
    Colors.white,
  ];
  static var loginBackground = [
    ColorUtils.parse("#FF4D70"),
    ColorUtils.parse("#646AE1"),
    ColorUtils.parse("#CECFF2"),
  ];
}
