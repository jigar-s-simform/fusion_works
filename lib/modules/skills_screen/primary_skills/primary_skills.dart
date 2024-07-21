import 'package:flutter/material.dart';

import '../skills_list.dart';

class PrimarySkills extends StatelessWidget {
  const PrimarySkills({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for primary skills
    final primarySkills = [
      Skill('JavaScript', 'Web app development', 'BEGINNER'),
      Skill('Python', 'Scripting and analysis', 'BEGINNER'),
      Skill('Flutter', 'Mobile app development', 'INTERMEDIATE'),
      Skill('React', 'Dynamic web interfaces', 'INTERMEDIATE'),
      Skill('Java', 'Object-oriented programming', 'ADVANCED'),
      Skill('Django', 'Backend development', 'ADVANCED'),
      Skill('SQL', 'Database management', 'BEGINNER'),
      Skill('Node.js', 'Server-side development', 'INTERMEDIATE'),
      Skill('Machine Learning', 'ML algorithms', 'ADVANCED'),
    ];

    return SkillList(skills: primarySkills);
  }
}
