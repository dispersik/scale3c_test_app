import 'package:core_ui/app_color_theme.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static const TextStyle title = TextStyle(
      color: AppColorTheme.dark,
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.w900);

  static const TextStyle inputMain = TextStyle(
    color: AppColorTheme.secondaryText,
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle accentText = TextStyle(
    color: AppColorTheme.white,
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle actionButtonText = TextStyle(
    color: AppColorTheme.accentText,
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle body = TextStyle(
    color: AppColorTheme.accentText,
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle orangeClickableText = TextStyle(
    color: AppColorTheme.orangeText,
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );

  static const TextStyle key = TextStyle(
    color: AppColorTheme.profileTitleText,
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle value = TextStyle(
    color: AppColorTheme.white,
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle profileName = TextStyle(
    color: AppColorTheme.dark,
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
}
