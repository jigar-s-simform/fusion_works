import 'package:flutter/material.dart';

import '../skills_list.dart';

class PrimarySkills extends StatelessWidget {
  const PrimarySkills({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for primary skills
    final primarySkills = [
      Skill('Skill 1', 'Description of Skill 1', 'BEGINNER'),
      Skill('Skill 2', 'Description of Skill 2', 'BEGINNER'),
      Skill('Skill 3', 'Description of Skill 3', 'INTERMEDIATE'),
      Skill('Skill 4', 'Description of Skill 4', 'INTERMEDIATE'),
      Skill('Skill 5', 'Description of Skill 5', 'ADVANCED'),
      Skill('Skill 6', 'Description of Skill 6', 'ADVANCED'),
      Skill('Skill 7', 'Description of Skill 7', 'BEGINNER'),
      Skill('Skill 8', 'Description of Skill 8', 'INTERMEDIATE'),
      Skill('Skill 9', 'Description of Skill 9', 'ADVANCED'),
    ];

    return SkillList(skills: primarySkills);
  }
}
