import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Class to check for internet availability
class NetworkUtils {
  NetworkUtils._(this._networkStreamSub);

  static late final NetworkUtils instance;
  static late final Stream<List<ConnectivityResult>> stream;

  /// A stream to monitor state changes in network connectivity.
  final StreamSubscription<List<ConnectivityResult>> _networkStreamSub;

  static var _hasInternet = true;

  bool get hasInternet => _hasInternet;

  static void initialize() {
    stream = Connectivity().onConnectivityChanged;
    instance = NetworkUtils._(
      stream.listen(
        (event) {
          for (var i = 0; i < event.length; i++) {
            if (event[i]
                case ConnectivityResult.mobile || ConnectivityResult.wifi) {
              _hasInternet = true;
              break;
            }
            _hasInternet = false;
          }
        },
      ),
    );
  }

  void dispose() => _networkStreamSub.cancel();
}
