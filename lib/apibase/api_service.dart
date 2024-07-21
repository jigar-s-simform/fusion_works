import 'package:dio/dio.dart';
import 'package:fusion_works/model/response/llm_response_data.dart';
import 'package:fusion_works/model/response/profile/profile.dart';
import 'package:fusion_works/model/response/skill/skill_dm.dart';
import 'package:retrofit/retrofit.dart';

import '../model/model.dart';
import '../model/request/add_skill/add_skill_dm.dart';
import '../model/response/llm_response.dart';
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

  @GET('/messaging/ask')
  @FormUrlEncoded()
  Future<LLMResponse<LLMResponseData<String>>> getModelResponse(
    @Field('prompt') String prompt,
  );

  /// Skill
  @GET('/skill')
  Future<APIResponse<List<SkillDm>>> getSkill();

  /// Add Skill
  @POST('/skill')
  Future<APIResponse<User>> addSkill(
    @Body() AddSkillDm addSkillRequest,
  );
}
