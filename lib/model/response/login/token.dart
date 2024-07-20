import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Token {
  Token({
    required this.type,
    required this.username,
    required this.applicationName,
    required this.clientId,
    required this.tokenType,
    required this.accessToken,
    required this.expiresIn,
    required this.state,
    required this.scope,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  String type;
  String username;
  String applicationName;
  String clientId;
  String tokenType;
  String accessToken;
  int expiresIn;
  String state;
  String scope;

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
