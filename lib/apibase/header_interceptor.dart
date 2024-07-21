import 'dart:async';

import 'package:dio/dio.dart';

import '../utils/network_utils.dart';
import 'api_logger.dart';

class HeaderInterceptor extends Interceptor {
  HeaderInterceptor({
    this.showLogs = true,
    this.shouldAuthenticate = true,
  });

  final bool showLogs;
  final bool shouldAuthenticate;

  final APILogger _logger = APILogger();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final internet = NetworkUtils.instance.hasInternet;
    if (internet) {
      if (shouldAuthenticate) {
        final token = await checkToken();
        if (token?.isNotEmpty ?? false) {
          options.headers.putIfAbsent('Authorization', () => token);
          options.headers.putIfAbsent('Cookie', () => 'jwt=$token');
        }
      }
    } else {
      // TODO(username): Show no internet dialog or toast here.
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode == 401) {
      // TODO(username): Handle token expired
    }
    handler.resolve(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (err.response != null) {}

    handler.reject(err);
  }

  Future<String?> checkToken() async => Future.value(
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjMsImVtYWlsIjoiamFpZ2FuZXNoQGdtYWlsLmNvbSIsImlhdCI6MTcyMTU1Mzg2MywiZXhwIjoxNzI0MTQ1ODYzfQ.n8XKcU51Wnv1hZiZCHFtqtMCzcZxNAX6NiblRPm-Org');
}
