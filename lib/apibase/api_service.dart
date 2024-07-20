import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/model.dart';
import '../model/response/login/token.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  /// Login
  @POST('/login')
  Future<APIResponse<Token>> login(
    @Query('email') String email,
    @Query('password') String password,
  );

  /// Register
  @POST('/register')
  Future<APIResponse<Token>> register(
    @Query('email') String email,
    @Query('password') String password,
  );

  /// Profile
  @GET('/profile')
  Future<APIResponse<User>> getProfile(
    @Query('email') String email,
  );
}
