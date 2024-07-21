import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../app.dart';
import '../../gen/assets.gen.dart';
import '../../values/app_theme.dart';
import '../../values/strings.dart';
import 'primary_skills/primary_skills.dart';
import 'secondary_skills/secondary_skills.dart';
import 'skills_store.dart';
import 'skills_tab_header.dart';

class SkillsScreen extends StatelessWidget {
  SkillsScreen({super.key});

  final SkillsStore skillsStore = SkillsStore();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  AppStrings.skillsTitle,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppTheme.monsterrat,
                  ),
                ),
              ),
              InkWell(
                onTap: () =>
                    navigatorKey.currentState?.pushNamed(AppRoutes.addSkills),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Assets.icons.add.svg(
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Observer(
          builder: (_) => SkillsTabHeader(
            tabs: [
              TabConfig(
                label: AppStrings.primarySkills,
                onTap: skillsStore.selectPrimary,
                isSelected: skillsStore.isPrimarySelected,
              ),
              TabConfig(
                label: AppStrings.secondarySkills,
                onTap: skillsStore.selectSecondary,
                isSelected: !skillsStore.isPrimarySelected,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Observer(
          builder: (_) => Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: skillsStore.isPrimarySelected
                  ? const PrimarySkills()
                  : const SecondarySkills(),
            ),
          ),
        ),
      ],
    );
  }
}
