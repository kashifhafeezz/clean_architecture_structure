import 'package:flutter/material.dart';
import 'package:vg_cli/core/localization/cubit/locale_cubit.dart';
import 'package:vg_cli/gen/fonts.gen.dart';

class AppConstants {
  factory AppConstants() {
    return _singleton;
  }

  AppConstants._internal();

  static final AppConstants _singleton = AppConstants._internal();

  ///---PADDING---///
  static const double kAppCommonPadding = 8;
  static const double kAppScreenPadding = 14;

  ///---HEIGHT-WIDTH---///
  static const double kAppHeight = 10;
  static const double kAppWidth = 10;

  ///---Border Radius---///
  static const double kAppBorderRadius = 16;
  static const double kAppCommonBorderRadius = 8;

  bool get isArabic =>
      SupportedLanguageLocales.currentLocale ==
      SupportedLanguageLocales.arabicLocale;
}

class AppColors {
  factory AppColors() {
    return _singleton;
  }

  AppColors._internal();

  static final AppColors _singleton = AppColors._internal();

  Color appPrimaryColor = Colors.blue.shade300;
  Color appSecondaryColor = const Color(0xFFFFDD28);
  Color appTerritoryColor = const Color(0xFFFF5D39);
  Color appSuccessColor = const Color(0xFF47DE68);
  Color appTransparentColor = Colors.transparent;
  Color appBodyBgColor = Colors.grey.shade100;
  Color appWhiteColor = Colors.white;
  Color appBlackColor = Colors.black;
  Color appGreyColor = Colors.grey;
}

class AppTextStyles {
  factory AppTextStyles() {
    return _singleton;
  }

  AppTextStyles._internal();

  static final AppTextStyles _singleton = AppTextStyles._internal();

  TextStyle? smallTextStyle({
    required BuildContext context,
    Color? textColor,
  }) {
    return TextStyle(
      color: textColor ?? AppColors().appWhiteColor,
      fontFamily: FontFamily.geologica,
      fontWeight: FontWeight.w300,
      fontSize: 18,
    );
  }

  TextStyle? mediumTextStyle({
    required BuildContext context,
    Color? textColor,
  }) {
    return TextStyle(
      color: textColor ?? AppColors().appWhiteColor,
      fontFamily: FontFamily.geologica,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    );
  }

  TextStyle? largeTextStyle({
    required BuildContext context,
    Color? textColor,
  }) {
    return TextStyle(
      color: textColor ?? AppColors().appWhiteColor,
      fontFamily: FontFamily.geologica,
      fontWeight: FontWeight.w700,
      fontSize: 26,
    );
  }
}
