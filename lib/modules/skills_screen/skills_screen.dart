import 'package:flutter/material.dart';

import '../../app.dart';
import '../../gen/assets.gen.dart';
import '../../values/app_colors.dart';
import '../../values/strings.dart';
import 'primary_skills/primary_skills.dart';
import 'secondary_skills/secondary_skills.dart';
import 'skills_store.dart';

class SkillsScreen extends StatelessWidget {
  SkillsScreen({super.key});

  final SkillsStore skillsStore = SkillsStore();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      AppStrings.skillsTitle,
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => navigatorKey.currentState
                        ?.pushNamed(AppRoutes.addSkills),
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
            const TabBar(
              tabs: [
                Tab(text: AppStrings.primarySkills),
                Tab(text: AppStrings.secondarySkills),
              ],
              indicatorColor: AppColors.colorPrimary,
              labelColor: AppColors.colorPrimary,
              unselectedLabelColor: AppColors.sectionListText,
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  PrimarySkills(),
                  SecondarySkills(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
