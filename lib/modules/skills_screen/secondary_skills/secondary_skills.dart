import 'package:flutter/material.dart';

import '../skills_list.dart';

class SecondarySkills extends StatelessWidget {
  const SecondarySkills({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for primary skills
    final secondarySkills = [
      Skill('HTML', 'Markup language', 'BEGINNER'),
      Skill('CSS', 'Styling web pages', 'BEGINNER'),
      Skill('Git', 'Version control', 'INTERMEDIATE'),
      Skill('Docker', 'Containerization', 'INTERMEDIATE'),
      Skill('AWS', 'Cloud services', 'ADVANCED'),
      Skill('Linux', 'Operating system', 'ADVANCED'),
      Skill('GraphQL', 'API query language', 'BEGINNER'),
      Skill('Kubernetes', 'Container orchestration', 'INTERMEDIATE'),
      Skill('TensorFlow', 'ML framework', 'ADVANCED'),
    ];

    return SkillList(skills: secondarySkills);
  }
}
