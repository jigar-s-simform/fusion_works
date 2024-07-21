import 'package:flutter/material.dart';
import 'package:fusion_works/values/app_colors.dart';

import '../../../utils/enumeration.dart';

// Define a data model for the skills
class Skill {
  Skill(this.name, this.description, this.category);

  final String name;
  final String description;
  final String category;
}

class SkillList extends StatelessWidget {
  const SkillList({
    required this.skills,
    super.key,
  });

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.separated(
        itemCount: skills.length,
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.divider,
        ),
        itemBuilder: (context, index) {
          final skill = skills[index];
          final skillCategory = SkillCategory.fromString(skill.category);

          return ListTile(
            title: Text(
              skill.name,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              skill.description,
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
                  fontWeight: FontWeight.w500,
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
