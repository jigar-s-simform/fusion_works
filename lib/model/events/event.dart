import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

enum EventType {
  HOLIDAY,
  FLOATER,
  EVENT;

  bool get isEvent => this == EVENT;
}

enum EventMode {
  ONLINE,
  OFFLINE;

  bool get isOnline => this == ONLINE;
}

@JsonSerializable()
class Event {
  const Event({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.emode,
    required this.etype,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime startTime;
  final DateTime endTime;
  final EventMode emode;
  final EventType etype;

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
