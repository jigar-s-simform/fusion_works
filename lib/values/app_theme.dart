import 'package:flutter/material.dart';
import 'package:fusion_works/values/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static const String monsterrat = 'Monsterrat';

  static final ThemeData lightTheme = ThemeData(
    colorSchemeSeed: AppColors.colorPrimary,
    fontFamily: "Fonts/Montserrat.ttf",
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.hintText,
        fontFamily: 'Montserrat',
      ),
      bodySmall: const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
      ),
      titleMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark();
}
