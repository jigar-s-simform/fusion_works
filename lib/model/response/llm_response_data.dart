import 'package:json_annotation/json_annotation.dart';

part 'llm_response_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LLMResponseData<T> {
  const LLMResponseData({this.response});
  final T? response;

  factory LLMResponseData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$LLMResponseDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$LLMResponseDataToJson(this, toJsonT);
}
