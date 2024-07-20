import 'package:mobx/mobx.dart';

import '../../apibase/repository.dart';
import '../../model/response/login/token.dart';
import '../../utils/enumeration.dart';

part 'login_screen_store.g.dart';

class LoginScreenStore = _LoginScreenStore with _$LoginScreenStore;

abstract class _LoginScreenStore with Store {
  _LoginScreenStore(this._repository);
  final Repository _repository;

  @observable
  NetworkState state = NetworkState.idle;

  @observable
  Token? response;

  @action
  Future<void> login(String email, String password) async {
    state = NetworkState.loading;
    response = await _repository.login(email, password);
    // Todo(shubham): saveToken()
    state = NetworkState.success;
  }

  void dispose() {}
}
