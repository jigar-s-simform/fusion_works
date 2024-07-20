import 'package:flutter/material.dart';
import 'package:fusion_works/values/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    colorSchemeSeed: AppColors.colorPrimary,
  );

  static final ThemeData darkTheme = ThemeData.dark();
}
