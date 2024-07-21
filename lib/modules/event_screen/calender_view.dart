import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:fusion_works/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../values/app_colors.dart';
import '../../values/strings.dart';
import 'event_store.dart';
import 'time_line.dart';

class CalenderView extends StatelessObserverWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    final eventStore = Provider.of<EventStore>(context);
    final events = eventStore.events;
    final eventList = <NeatCleanCalendarEvent>[];
    for (var i = 0; i < events.length; i++) {
      eventList.add(events[i].toNeatCleanCalendarEvent());
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.calendar,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Expanded(
              child: Calendar(
                weekDays: const [
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thu',
                  'Fri',
                  'Sat',
                  'Sun'
                ],
                hideTodayIcon: true,
                startOnMonday: true,
                eventsList: eventList,
                isExpandable: true,
                selectedTodayColor: AppColors.colorPrimary,
                todayColor: AppColors.colorPrimary,
                selectedColor: AppColors.colorPrimary,
                todayButtonText: AppStrings.calendar,
                eventColor: AppColors.colorPrimary,
                isExpanded: true,
                dayOfWeekStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      color: AppColors.black,
                    ),
                eventListBuilder: (BuildContext context,
                    List<NeatCleanCalendarEvent> eventList) {
                  return Expanded(
                    child: TimelineEventCard(events: eventList),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
