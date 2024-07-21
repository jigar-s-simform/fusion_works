import 'package:fusion_works/model/response/skill/skill_dm.dart';
import 'package:mobx/mobx.dart';

import '../../apibase/repository.dart';
import '../../utils/enumeration.dart';

part 'skills_store.g.dart';

class SkillsStore = _SkillsStore with _$SkillsStore;

abstract class _SkillsStore with Store {
  @observable
  bool isPrimarySelected = true;

  @action
  void selectPrimary() {
    isPrimarySelected = true;
  }

  @action
  void selectSecondary() {
    isPrimarySelected = false;
  }

  @observable
  String? selectedValue;

  @action
  void setSelectedValue(String? value) {
    selectedValue = value;
  }

  @observable
  String? selectedCategory;

  // Observable for skill dropdown
  @observable
  String? selectedSkill;

  // Observable for proficiency dropdown
  @observable
  String? selectedProficiency;

  // Actions to set selected values
  @action
  void setSelectedCategory(String? value) {
    selectedCategory = value;
  }

  @action
  void setSelectedSkill(String? value) {
    selectedSkill = value;
  }

  @action
  void setSelectedProficiency(String? value) {
    selectedProficiency = value;
  }

  @observable
  NetworkState skillState = NetworkState.idle;

  @observable
  ObservableList<SkillDm>? skillsResponse;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchUserSkills() async {
    try {
      errorMessage = null;
      skillState = NetworkState.loading;

      final result = await Repository.instance.getUserSkills();
      skillsResponse = result.asObservable();

      print('skill response $skillsResponse');

      skillState = NetworkState.success;
    } catch (e) {
      skillState = NetworkState.error;
      errorMessage = e.toString();
    }
  }
}
