import 'package:flutter/material.dart';
import 'package:fusion_works/modules/profileScreen/project_details_sheet.dart';
import 'package:fusion_works/values/app_colors.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const ProjectDetailsSheet(
            title: 'Fusion Works',
            description:
                'The project is about integrating various features of organisational communication to create a single source of communication for various purposes.',
            startTime: 'Jan 2024',
            endTime: 'Aug 2024',
            progress: 60,
            client: 'Mr. Jason Green',
          );
        },
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fusion Works',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '20 Members | 20 July, 2024',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
