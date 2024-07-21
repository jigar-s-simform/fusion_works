import 'package:flutter/material.dart';
import 'package:fusion_works/values/skills_dummy_data.dart';

import '../../../utils/enumeration.dart';
import '../../model/response/skill/skill_dm.dart';
import '../../values/app_colors.dart';

class SkillList extends StatelessWidget {
  const SkillList({
    this.skills,
    super.key,
  });

  final List<SkillDm>? skills;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final skillList = skills ?? skillsList;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.separated(
        itemCount: skillList.length,
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.divider,
        ),
        itemBuilder: (context, index) {
          final skill = skillList[index];
          final skillCategory = SkillCategory.fromString(skill?.level ?? '');

          return ListTile(
            title: Text(
              skill?.skill ?? '',
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              skill?.category ?? '',
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: AppColors.grey,
              ),
            ),
            trailing: Chip(
              label: Text(
                skillCategory.label,
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  color: skillCategory.categoryColor,
                ),
              ),
              backgroundColor: skillCategory.backgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: AppColors.white,
                ),
              ),
              labelPadding: EdgeInsets.zero,
            ),
          );
        },
      ),
    );
  }
}
