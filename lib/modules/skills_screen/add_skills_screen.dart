import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../app.dart';
import '../../gen/assets.gen.dart';
import '../../values/app_colors.dart';
import '../../values/app_theme.dart';
import '../../values/strings.dart';
import 'skills_dropdown.dart';
import 'skills_store.dart';

class AddSkillsScreen extends StatelessWidget {
  AddSkillsScreen({super.key});
  final SkillsStore skillsStore = SkillsStore();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => navigatorKey.currentState?.pop(),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Assets.icons.close.svg(
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  const Text(
                    AppStrings.addSkill,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppTheme.monsterrat,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Category',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.monsterrat,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Observer(
              builder: (_) => SkillsDropdown<String>(
                hint: 'Select a category',
                value: skillsStore.selectedCategory,
                items: const ['Category 1', 'Category 2', 'Category 3'],
                onChanged: skillsStore.setSelectedCategory,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Skill',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.monsterrat,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Observer(
              builder: (_) => SkillsDropdown<String>(
                hint: 'Select a skill',
                value: skillsStore.selectedSkill,
                items: const ['Skill 1', 'Skill 2', 'Skill 3'],
                onChanged: skillsStore.setSelectedSkill,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Proficiency',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.monsterrat,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Observer(
              builder: (_) => SkillsDropdown<String>(
                hint: 'Select proficiency',
                value: skillsStore.selectedProficiency,
                items: const ['Beginner', 'Intermediate', 'Expert'],
                onChanged: skillsStore.setSelectedProficiency,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
