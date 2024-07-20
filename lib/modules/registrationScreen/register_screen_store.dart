import 'package:mobx/mobx.dart';

import '../../apibase/repository.dart';
import '../../model/response/login/token.dart';
import '../../utils/enumeration.dart';

part 'register_screen_store.g.dart';

class RegisterScreenStore = _RegisterScreenStore with _$RegisterScreenStore;

abstract class _RegisterScreenStore with Store {
  _RegisterScreenStore(this._repository);
  final Repository _repository;

  @observable
  NetworkState state = NetworkState.idle;

  @observable
  Token? response;

  @action
  Future<void> register(String email, String password) async {
    state = NetworkState.loading;
    response = await _repository.register(email, password);
    // Todo(shubham): saveToken()
    state = NetworkState.success;
  }

  void dispose() {}
}
