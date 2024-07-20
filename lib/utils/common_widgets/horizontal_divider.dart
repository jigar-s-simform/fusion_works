import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final String text;
  const HorizontalDivider(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(height: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(text),
        ),
        const Expanded(
          child: Divider(height: 1),
        ),
      ],
    );
  }
}
