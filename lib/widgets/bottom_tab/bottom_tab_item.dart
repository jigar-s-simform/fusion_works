import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class BottomTabItem extends StatelessWidget {
  const BottomTabItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.icon,
  });

  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTabSelected(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: icon.svg(
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
