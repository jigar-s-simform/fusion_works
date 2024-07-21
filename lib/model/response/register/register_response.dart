import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegisterResponse {
  RegisterResponse({
    this.statusCode,
    this.message,
    this.data,
    this.error,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
  @JsonKey(name: "status_code")
  int? statusCode;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "error")
  dynamic error;

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  @JsonKey(name: "access_token")
  String? accessToken;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
