import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fusion_works/values/constants.dart';
import 'package:provider/provider.dart';

import '../../app.dart';
import '../../gen/assets.gen.dart';
import '../../utils/common_widgets/fw_button.dart';
import '../../values/app_colors.dart';
import '../../values/app_theme.dart';
import '../../values/strings.dart';
import 'skills_dropdown.dart';
import 'skills_store.dart';

class AddSkillsScreen extends StatelessWidget {
  const AddSkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skillsStore = context.read<SkillsStore>();
    return Material(
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => navigatorKey.currentState?.pop(),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Assets.icons.close.svg(
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                          const Text(
                            AppStrings.addSkill,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppTheme.monsterrat,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      AppStrings.category,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppTheme.monsterrat,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Observer(
                      builder: (_) => SkillsDropdown<String>(
                        hint: AppStrings.chooseCategory,
                        value: skillsStore.selectedCategory,
                        items: Constants.category,
                        onChanged: skillsStore.setSelectedCategory,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      AppStrings.skill,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppTheme.monsterrat,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Observer(
                      builder: (_) => SkillsDropdown<String>(
                        hint: AppStrings.chooseSkill,
                        value: skillsStore.selectedSkill,
                        items: Constants.skills,
                        onChanged: skillsStore.setSelectedSkill,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      AppStrings.proficiency,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppTheme.monsterrat,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Observer(
                      builder: (_) => SkillsDropdown<String>(
                        hint: AppStrings.chooseProficiency,
                        value: skillsStore.selectedProficiency,
                        items: Constants.skillProficiency,
                        onChanged: skillsStore.setSelectedProficiency,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black12,
                      offset: Offset(0, -4),
                      blurRadius: 20,
                    ),
                  ],
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: FwButton(
                        text: AppStrings.add,
                        setOnClickListener: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
