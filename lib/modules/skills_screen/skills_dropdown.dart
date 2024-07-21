import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_theme.dart';

class SkillsDropdown<T> extends StatelessWidget {
  const SkillsDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });
  final String hint;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.lightGrey,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          isExpanded: true,
          value: value,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              hint,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: AppTheme.monsterrat,
                color: AppColors.grey,
              ),
            ),
          ),
          items: items.map<DropdownMenuItem<T>>((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppTheme.monsterrat,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          iconStyleData: const IconStyleData(
            icon: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
              ),
            ),
            iconSize: 25,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
    );
  }
}
