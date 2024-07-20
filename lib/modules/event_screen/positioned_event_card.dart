import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

import '../../model/events/event.dart';
import '../../utils/event_utils.dart';
import '../../values/app_colors.dart';
import '../../values/constants.dart';
import '../../widgets/fw_bottom_sheet.dart';

class PositionedEventCard extends StatelessWidget {
  const PositionedEventCard({required this.event, super.key});

  final NeatCleanCalendarEvent event;

  double _calculateTopOffset(TimeOfDay time) {
    return ((time.hour * 60 + time.minute) / 30) *
        (Constants.timeLineCardHeight / 2);
  }

  double _calculateHeight(TimeOfDay startTime, TimeOfDay endTime) {
    final startMinutes = startTime.hour * 60 + startTime.minute;
    final endMinutes = endTime.hour * 60 + endTime.minute;
    final height = endMinutes - startMinutes;
    final heightFactor = height / 30;
    return (heightFactor * Constants.eventCardHeight) +
        ((heightFactor - 1) * 20);
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final offset =
        (_calculateTopOffset(EventUtils.dateTimeToTimeOfDay(event.startTime)) *
                2) +
            35;
    final height = _calculateHeight(
      EventUtils.dateTimeToTimeOfDay(event.startTime),
      EventUtils.dateTimeToTimeOfDay(event.endTime),
    );
    return Positioned(
      top: event.isAllDay ? 40 : offset,
      left: 0,
      right: 0,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return BottomSheetContent(
              title: event.summary,
              description: event.description,
              date: event.startTime,
              startTime: EventUtils.dateTimeToTimeOfDay(event.startTime),
              endTime: EventUtils.dateTimeToTimeOfDay(event.endTime),
              eventMode: EventMode.ONLINE,
              isAllDay: event.isAllDay,
            );
          },
        ),
        child: Container(
          width: deviceWidth,
          height: height < 0 || event.isAllDay ? 44 : height,
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 64,
            right: 24,
          ),
          decoration: BoxDecoration(
            color: event.color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 16),
                child: Row(
                  children: [
                    Container(
                      color: event.color == AppColors.lightGreen
                          ? AppColors.darkGreen
                          : AppColors.darkOrange,
                      width: 3,
                      height: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        event.summary,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
