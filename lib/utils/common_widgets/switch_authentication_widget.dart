import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class SwitchAuthenticatinWidget extends StatelessWidget {
  const SwitchAuthenticatinWidget({
    required this.title,
    required this.highlightedTitle,
    required this.onTapPressed,
    super.key,
  });

  final String title;
  final String highlightedTitle;
  final VoidCallback onTapPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: theme.textTheme.labelLarge,
            children: [
              TextSpan(
                text: highlightedTitle,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.colorPrimary,
                ),
                recognizer: TapGestureRecognizer()..onTap = onTapPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
