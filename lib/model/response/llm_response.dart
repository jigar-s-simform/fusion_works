import 'package:json_annotation/json_annotation.dart';

part 'llm_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LLMResponse<T> {
  const LLMResponse({this.data});
  final T? data;

  factory LLMResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$LLMResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$LLMResponseToJson(this, toJsonT);
}
