import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:fusion_works/utils/extensions.dart';
import 'package:fusion_works/values/app_colors.dart';

class BotToastService {
  const BotToastService._();

  static void showSnack(
    String message, {
    TextStyle? textStyle,
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    BotToast.showSimpleNotification(
      title: message,
      duration: duration,
      backgroundColor: AppColors.grey,
      titleStyle: textStyle ??
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isError ? AppColors.darkOrange : AppColors.white,
          ),
    );
  }
}
