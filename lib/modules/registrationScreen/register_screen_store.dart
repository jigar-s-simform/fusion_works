import 'dart:ui';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fusion_works/model/response/register/register_request.dart';
import 'package:fusion_works/utils/helpers/dummy_data.dart';
import 'package:mobx/mobx.dart';

import '../../apibase/repository.dart';
import '../../model/response/register/register_response.dart';
import '../../services/secure_storage.dart';
import '../../utils/enumeration.dart';

part 'register_screen_store.g.dart';

class RegisterScreenStore = _RegisterScreenStore with _$RegisterScreenStore;

abstract class _RegisterScreenStore with Store {
  @observable
  NetworkState state = NetworkState.idle;

  @observable
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @observable
  RegisterResponse? response;

  @action
  Future<void> register(
    String email,
    String password,
    VoidCallback navigate,
  ) async {
    state = NetworkState.loading;
    final request = RegisterRequest(
      fullName: DummyData.getRandomFullName(),
      email: email,
      phoneNumber: DummyData.getRandomMobileNumber(),
      employeeCode: DummyData.getRandomEmployeeCode(),
      dob: DummyData.generateRandomDateOfBirth(),
      designation: DummyData.getRandomDesignation(),
      department: DummyData.getRandomDepartment(),
      password: password,
    );
    try {
      state = NetworkState.loading;
      response = await Repository.instance.register(request);
      await SecureStorage.setValue(
        key: SecureStorageKeys.kAccessToken,
        value: response?.data?.accessToken,
      );
      final token =
          await SecureStorage.getValue(key: SecureStorageKeys.kAccessToken);
      print("Token jwt: ${token} response: ${response?.message}");
      state = NetworkState.success;
      navigate();
    } catch (e) {
      state = NetworkState.success;
      navigate();
    }
  }
}
