import 'package:flutter/material.dart';

class EventUtils {
  static TimeOfDay dateTimeToTimeOfDay(DateTime dateTime) {
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  static DateTime timeOfDayToDateTime(
      TimeOfDay timeOfDay, DateTime referenceDate) {
    return DateTime(referenceDate.year, referenceDate.month, referenceDate.day,
        timeOfDay.hour, timeOfDay.minute);
  }
}
