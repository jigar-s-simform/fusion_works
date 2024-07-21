import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/neat_and_clean_calendar_event.dart';

import 'positioned_event_card.dart';
import 'time_line_background.dart';

class TimelineEventCard extends StatelessWidget {
  const TimelineEventCard({required this.events, super.key});
  final List<NeatCleanCalendarEvent> events;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          ...events.map(
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
