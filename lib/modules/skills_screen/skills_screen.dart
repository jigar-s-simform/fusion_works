import 'package:flutter/material.dart';
import 'package:fusion_works/utils/enumeration.dart';

import '../../app.dart';
import '../../gen/assets.gen.dart';
import '../../values/app_colors.dart';
import '../../values/strings.dart';
import 'skills_list.dart';
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
        body: skillsStore.skillState == NetworkState.loading
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: AppColors.black,
                  strokeWidth: 1.5,
                ),
              )
            : Column(
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
                  Expanded(
                    child: TabBarView(
                      children: [
                        SkillList(skills: skillsStore.skillsResponse),
                        SkillList(skills: skillsStore.skillsResponse),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
