import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class TimeOfDayConverter extends JsonConverter<TimeOfDay, Map<String, int>> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(Map<String, int> json) {
    return TimeOfDay(
      hour: json['hour'] ?? 0,
      minute: json['minute'] ?? 0,
    );
  }

  @override
  Map<String, int> toJson(TimeOfDay object) {
    return {
      'hour': object.hour,
      'minute': object.minute,
    };
  }
}
