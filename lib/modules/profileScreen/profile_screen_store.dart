import 'package:mobx/mobx.dart';

import '../../apibase/repository.dart';
import '../../model/response/user/user.dart';

part 'profile_screen_store.g.dart';

class ProfileScreenStore = _ProfileScreenStore with _$ProfileScreenStore;

abstract class _ProfileScreenStore with Store {
  _ProfileScreenStore(this._repository);

  final Repository _repository;

  @observable
  User? userInfo;

  @action
  Future<void> getProfile(String email) async {
    userInfo = await _repository.getProfileFromEmail(email);
  }

  void dispose() {}
}
