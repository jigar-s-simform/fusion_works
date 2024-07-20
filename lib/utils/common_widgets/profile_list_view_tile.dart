import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../values/app_colors.dart';

class ProfileListViewTile extends StatelessWidget {
  const ProfileListViewTile({
    super.key,
    required this.svgImagePath,
    required this.title,
    required this.subtitle,
  });

  final String svgImagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SvgPicture.asset(
                svgImagePath,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.colorPrimary,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: AppColors.darkGrey),
                  ),
                  Text(
                    subtitle,
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: AppColors.divider,
        ),
      ],
    );
  }
}
