import 'package:mobx/mobx.dart';

import '../../apibase/repository.dart';
import '../../model/events/event.dart';

part 'event_store.g.dart';

class EventStore = _EventStore with _$EventStore;

abstract class _EventStore with Store {
  @observable
  List<Event> events = ObservableList<Event>();

  late String errorMessage;

  @action
  Future<void> createEvent(Event event) async {
    events.add(event);
  }

  @action
  Future<void> updateEvent(Event updatedEvent) async {
    var index = events.indexWhere((event) => event.id == updatedEvent.id);
    if (index != -1) {
      events[index] = updatedEvent;
    }
  }

  @action
  Future<void> deleteEvent(int eventId) async {
    events.removeWhere((event) => event.id == eventId);
  }

  List<Event> generateStaticEvents() {
    final List<Event> events = [];
    final List<DateTime> eventDates = [DateTime(2024, 7, 21)];

    final List<int> durationsInMinutes = [30, 60, 120];

    for (int i = 0; i < 1; i++) {
      final DateTime startTime = eventDates[i].add(Duration(hours: i + 1));
      final DateTime endTime = startTime.add(Duration(
        minutes: durationsInMinutes[i % durationsInMinutes.length],
      ));

      events.add(Event(
        id: i + 1,
        createdAt: DateTime(2024, 6, 21),
        updatedAt: DateTime(2024, 6, 1),
        title: 'Sample Event ${i + 1}',
        description: 'Sample description ${i + 1}',
        startDate: eventDates[i],
        endDate: eventDates[i],
        startTime: startTime,
        endTime: endTime,
        emode: (i % 2 == 0) ? EventMode.ONLINE : EventMode.OFFLINE,
        etype: EventType.EVENT,
      ));
    }
    return events;
  }

  @action
  Future<void> getAllEvents() async {
    events = ObservableList.of(generateStaticEvents());
    await fetchAllEvents();
  }

  @action
  Event? getEventDetails(int eventId) {
    return events.firstWhere(
      (event) => event.id == eventId,
    );
  }

  Future<void> fetchAllEvents() async {
    try {
      errorMessage = '';
      final result = await Repository.instance.getEvents();
      if (result?.events != null) {
        if (result!.events.isNotEmpty) events = result!.events;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
