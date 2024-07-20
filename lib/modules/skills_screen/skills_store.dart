import 'package:mobx/mobx.dart';

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
}
