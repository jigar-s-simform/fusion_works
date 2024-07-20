import 'package:flutter/material.dart';

class FwOutlinedButton extends StatelessWidget {
  const FwOutlinedButton({
    required this.title,
    required this.pngIconPath,
    required this.onPressed,
    super.key,
  });
  final String title;
  final String pngIconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          // padding: MaterialStateProperty.all<EdgeInsets>(
          //   const EdgeInsets.symmetric(horizontal: 36),
          // ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Colors.red),
            ),
          ),
        ),
        icon: Image.asset(pngIconPath),
        label: Text(
          title,
          style: theme.textTheme.labelLarge,
        ),
      ),
    );
  }
}
