import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../values/app_colors.dart';
import 'bottom_tab_item.dart'; // Ensure you import your color values

class BottomTab extends StatelessWidget {
  const BottomTab({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black12,
            offset: Offset(0, -4),
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BottomAppBar(
          surfaceTintColor: AppColors.white,
          child: SizedBox(
            height: 60, // Set the height for the custom tab bar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomTabItem(
                  index: 0,
                  selectedIndex: selectedIndex,
                  onTabSelected: onTabSelected,
                  icon: selectedIndex == 0
                      ? Assets.icons.calendarEmptyFill
                      : Assets.icons.calendarEmpty,
                ),
                BottomTabItem(
                  index: 1,
                  selectedIndex: selectedIndex,
                  onTabSelected: onTabSelected,
                  icon: selectedIndex == 1
                      ? Assets.icons.cupFill
                      : Assets.icons.cup,
                ),
                const SizedBox(width: 48),
                BottomTabItem(
                  index: 2,
                  selectedIndex: selectedIndex,
                  onTabSelected: onTabSelected,
                  icon: selectedIndex == 2
                      ? Assets.icons.element3Fill
                      : Assets.icons.element3,
                ),
                BottomTabItem(
                  index: 3,
                  selectedIndex: selectedIndex,
                  onTabSelected: onTabSelected,
                  icon: selectedIndex == 3
                      ? Assets.icons.profileFill
                      : Assets.icons.profile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
