import 'package:dio/dio.dart';
import 'package:fusion_works/model/response/profile/profile.dart';
import 'package:retrofit/retrofit.dart';

import '../model/model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  /// Login
  @POST('/login')
  Future<APIResponse<User>> login(
    @Body() Map<String, dynamic> loginRequestBean,
  );

  /// Profile
  @GET('/profile')
  Future<APIResponse<Profile>> getProfile(
    @Query('email') String email,
  );
}
