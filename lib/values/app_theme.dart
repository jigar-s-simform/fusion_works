import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fusion_works/values/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static const String monsterrat = 'Monsterrat';

  static final ThemeData lightTheme = ThemeData(
    colorSchemeSeed: AppColors.colorPrimary,
    highlightColor: Platform.isIOS ? AppColors.transparent : null,
    splashColor: Platform.isIOS ? AppColors.transparent : null,
    splashFactory: Platform.isIOS ? NoSplash.splashFactory : null,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark();
}
