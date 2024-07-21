import 'package:flutter/material.dart';
import 'package:fusion_works/modules/profileScreen/project_tile.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (_, index) => const ProjectTile(),
      ),
    );
  }
}
