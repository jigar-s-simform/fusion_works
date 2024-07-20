import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

import '../../apibase/network_state_store.dart';
import '../../utils/network_utils.dart';

part 'splash_screen_store.g.dart';

class SplashScreenStore = _SplashScreenStore with _$SplashScreenStore;

abstract class _SplashScreenStore extends NetworkStateStore with Store {
  _SplashScreenStore() {
    connectivitySubscription = NetworkUtils.stream.listen((event) {
      hasInternet = !event.contains(ConnectivityResult.none);
    });
  }

  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;

  @observable
  bool hasInternet = true;
  void cancelSubscription() {
    connectivitySubscription.cancel();
  }
}
