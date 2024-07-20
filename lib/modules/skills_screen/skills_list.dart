import 'package:flutter/material.dart';
import 'package:fusion_works/values/app_colors.dart';

import '../../../utils/enumeration.dart';
import '../../../values/app_theme.dart';

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
    return Container(
      padding: const EdgeInsets.all(16),
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
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: AppTheme.monsterrat,
              ),
            ),
            subtitle: Text(
              skill.description,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: AppTheme.monsterrat,
                color: AppColors.grey,
              ),
            ),
            trailing: IntrinsicWidth(
              child: Container(
                height: 24,
                decoration: BoxDecoration(
                  color: skillCategory.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Text(
                    skillCategory.label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppTheme.monsterrat,
                      color: skillCategory.categoryColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
