import 'package:fusion_works/model/events/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_response.g.dart';

@JsonSerializable()
class EventResponse {
  const EventResponse({required this.events});

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);
  final List<Event> events;

  Map<String, dynamic> toJson() => _$EventResponseToJson(this);
}
