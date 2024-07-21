import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_theme.dart';

class TabConfig {
  TabConfig({
    required this.label,
    required this.onTap,
    required this.isSelected,
  });
  final String label;
  final VoidCallback onTap;
  final bool isSelected;
}

class SkillsTabHeader extends StatelessWidget {
  const SkillsTabHeader({
    required this.tabs,
    super.key,
  });

  final List<TabConfig> tabs;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tabs.map((tab) {
        return InkWell(
          onTap: tab.onTap,
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
                tab.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppTheme.monsterrat,
                  color: tab.isSelected
                      ? AppColors.blue
                      : AppColors.sectionListText,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 167.5,
                height: 3,
                decoration: BoxDecoration(
                  color: tab.isSelected ? AppColors.blue : AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
