import 'package:dio/dio.dart';
import 'package:fusion_works/apibase/header_interceptor.dart';

import '../flavors/flavor_values.dart';
import 'api_service.dart';

class ApiServiceType {
  const ApiServiceType._();

  static final ApiService chatService = ApiService(
    _getDio(
      options: BaseOptions(
        baseUrl: FlavorValues.instance.baseUrl,
      ),
    ),
  );

  static final ApiService apiService = ApiService(
    _getDio(
      options: BaseOptions(baseUrl: FlavorValues.instance.baseUrl),
    ),
  );

  static Dio _getDio({
    required BaseOptions options,
    List<Interceptor>? interceptors,
  }) {
    final dio = Dio(options);

    dio.interceptors.addAll([
      HeaderInterceptor(),
      ...?interceptors,
    ]);
    return dio;
  }
}
