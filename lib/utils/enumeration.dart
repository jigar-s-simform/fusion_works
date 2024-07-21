import 'dart:ui';

import '../values/app_colors.dart';

enum NetworkState { idle, loading, success, error }

extension NetworkStateExtension on NetworkState {
  bool get isIdle => this == NetworkState.idle;

  bool get isLoading => this == NetworkState.loading;

  bool get isSuccessful => this == NetworkState.success;

  bool get isFailed => this == NetworkState.error;
}

enum SharedPrefsKeys { isLoggedIn }

enum SecureStorageKeys { kAccessToken }

enum EventType {
  holiday,
  floater,
  event,
}

enum EventMode {
  online,
  offline,
}

enum ChatOptions { documents, database }

enum SkillCategory {
  beginner(
    AppColors.chipBeginnerLabel,
    AppColors.chipBeginner,
    'Beginner',
  ),
  intermediate(
    AppColors.chipIntermediateLabel,
    AppColors.chipIntermediate,
    'Intermediate',
  ),
  advanced(
    AppColors.colorPrimary,
    AppColors.chipAdvanced,
    'Advanced',
  );

  const SkillCategory(this.categoryColor, this.backgroundColor, this.label);
  final Color categoryColor;
  final Color backgroundColor;
  final String label;

  bool get isBeginner => this == SkillCategory.beginner;
  bool get isIntermediate => this == SkillCategory.intermediate;
  bool get isAdvanced => this == SkillCategory.advanced;

  static SkillCategory fromString(String category) {
    switch (category.toUpperCase()) {
      case 'BEGINNER':
        return SkillCategory.beginner;
      case 'INTERMEDIATE':
        return SkillCategory.intermediate;
      case 'ADVANCED':
        return SkillCategory.advanced;
      default:
        throw ArgumentError('Invalid category string: $category');
    }
  }
}
