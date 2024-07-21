import 'package:fusion_works/model/response/skill/skill_dm.dart';
import 'package:fusion_works/values/skills_dummy_data.dart';
import 'package:mobx/mobx.dart';

import '../../apibase/repository.dart';
import '../../model/request/add_skill/add_skill_dm.dart';
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
  List<SkillDm>? skillsResponse;

  @observable
  List<SkillDm>? primarySkills;

  @observable
  List<SkillDm>? secondarySkills;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchUserSkills() async {
    try {
      errorMessage = null;
      skillState = NetworkState.loading;

      final result = await Repository.instance.getUserSkills();
      skillsResponse = result.skills;
      skillState = NetworkState.success;
    } catch (e) {
      skillState = NetworkState.error;
      errorMessage = e.toString();
      skillsResponse = skillsList;
    }
  }

  @observable
  NetworkState addSkillState = NetworkState.idle;

  @action
  Future<void> addSkill(AddSkillDm addSkillRequest) async {
    try {
      addSkillState = NetworkState.loading;
      final result = await Repository.instance.addSkill(addSkillRequest);
      addSkillState = NetworkState.success;

      await fetchUserSkills();
    } catch (e) {
      addSkillState = NetworkState.error;
    }
  }
}
