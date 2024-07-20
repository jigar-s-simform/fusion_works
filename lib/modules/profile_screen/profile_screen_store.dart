import 'package:mobx/mobx.dart';

import '../../apibase/repository.dart';
import '../../model/response/profile/profile.dart';

part 'profile_screen_store.g.dart';

class ProfileScreenStore = _ProfileScreenStore with _$ProfileScreenStore;

abstract class _ProfileScreenStore with Store {
  @observable
  Profile? profile;

  @action
  Future<void> getProfile(String email) async {
    profile = await Repository.instance.getProfileFromEmail(email);
  }
}
