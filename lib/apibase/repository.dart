import 'package:dio/dio.dart';
import 'package:fusion_works/model/events/event_response.dart';
import 'package:fusion_works/model/request/dsu_list_req_dm.dart';
import 'package:fusion_works/model/response/feed_status/dsu_res_dm.dart';
import 'package:fusion_works/model/response/login/token.dart';
import 'package:fusion_works/model/response/skill/skill_dm.dart';

import '../model/response/api_response.dart';
import '../model/response/invalid_response_model.dart';
import '../model/response/llm_response.dart';
import '../model/response/llm_response_data.dart';
import '../model/response/user/user.dart';
import '../values/strings.dart';
import 'api_service.dart';
import 'api_service_type.dart';

typedef ApiCallback<T> = Future<APIResponse<T>> Function();
typedef ModelApiCallback<T> = Future<T> Function();

class Repository {
  Repository._initialize(this._apiService);

  static final Repository chatDb =
      Repository._initialize(ApiServiceType.chatService);
  static final Repository instance =
      Repository._initialize(ApiServiceType.apiService);

  final ApiService _apiService;

  Future<User> getProfileFromEmail(String email) async {
    return _apiCall<User>(request: () => _apiService.getProfile(email));
  }

  Future<Token> login(String email, String password) async {
    return _apiCall<Token>(request: () => _apiService.login(email, password));
  }

  Future<Token> register(String email, String password) async {
    return _apiCall<Token>(
        request: () => _apiService.register(email, password));
  }

  Future<LLMResponse<LLMResponseData<String>>> getModelResponse(
    String prompt,
  ) async {
    return _apiCallModel<LLMResponse<LLMResponseData<String>>>(
        request: () => _apiService.getModelResponse(prompt));
  }

  Future<List<SkillDm>> getUserSkills() async {
    return _apiCall<List<SkillDm>>(request: _apiService.getSkill);
  }

  Future<DsuResDm> getDsuList(DsuListReqDm dsuListReqDm) async {
    return _apiCall<DsuResDm>(
      request: () => _apiService.getDsuList(dsuListReqDm),
    );
  }

  Future<String> getDocsModelResponse(String input) async {
    return _apiCall<String>(
      request: () => _apiService.getDocsModelResponse(input),
    );
  }

  Future<EventResponse?> getEvents() async {
    return _apiCall<EventResponse>(
      request: () => _apiService.getEventList(
        {"startDate": "2024-01-01", "endDate": "2025-12-31"},
      ),
    );
  }

  Future<T> _apiCall<T>({
    required ApiCallback<T> request,
    String noDataMessage = ApiErrorStrings.somethingWrongErrorMsg,
  }) async {
    try {
      final response = await request();
      if (response.data != null) {
        return response.data as T;
      } else {
        throw Exception(response.message ?? noDataMessage);
      }
    } on String {
      rethrow;
    } on DioException catch (error) {
      print("Error aaya $error");
      if (error.response == null) {
        throw Exception(ApiErrorStrings.noInternetMsg);
      }

      switch (error.response!.statusCode) {
        case 500:
        case 503:
        case 504:
        case 403:
        case 422:
        case 404:
        default:
          final response = InvalidResponseModel.fromJson(
            error.response!.data as Map<String, dynamic>,
          );
          throw Exception(response.message ?? '');
      }
    }
  }

  Future<T> _apiCallModel<T>({
    required ModelApiCallback<T> request,
    String noDataMessage = ApiErrorStrings.somethingWrongErrorMsg,
  }) async {
    try {
      final response = await request();
      if (response != null) {
        return response as T;
      } else {
        throw Exception(response ?? noDataMessage);
      }
    } on String {
      rethrow;
    } on DioException catch (error) {
      if (error.response == null) {
        throw Exception(ApiErrorStrings.noInternetMsg);
      }

      switch (error.response!.statusCode) {
        case 500:
        case 503:
        case 504:
        case 403:
        case 422:
        case 404:
        default:
          final response = InvalidResponseModel.fromJson(
            error.response!.data as Map<String, dynamic>,
          );
          throw Exception(response.message ?? '');
      }
    }
  }
}
