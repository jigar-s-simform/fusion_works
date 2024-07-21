import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class FwButton extends StatelessWidget {
  const FwButton({
    super.key,
    required this.text,
    required this.setOnClickListener,
    this.isLoading = false,
  });

  final VoidCallback setOnClickListener;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FilledButton(
      onPressed: setOnClickListener,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        fixedSize: Size.copy(
          const Size.fromHeight(56),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      child: !isLoading
          ? Text(
              text,
              style: textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            )
          : const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 1.5,
              ),
            ),
    );
  }
}
