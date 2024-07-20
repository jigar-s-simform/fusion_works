import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';

import 'positioned_event_card.dart';
import 'time_line_background.dart';

class TimelineEventCard extends StatelessWidget {
  const TimelineEventCard({required this.event, super.key});
  final List<NeatCleanCalendarEvent> event;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          ...event.map(
            (meeting) => PositionedEventCard(
              event: meeting,
            ),
          ),
          const TimelineBackground(),
        ],
      ),
    );
  }
}
