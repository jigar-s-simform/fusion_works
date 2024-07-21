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
    int index = events.indexWhere((event) => event.id == updatedEvent.id);
    if (index != -1) {
      events[index] = updatedEvent;
    }
  }

  @action
  Future<void> deleteEvent(int eventId) async {
    events.removeWhere((event) => event.id == eventId);
  }

  @action
  Future<void> getAllEvents() async {
    events = ObservableList.of([
      Event(
        id: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        title: 'Sample Event 1',
        description: 'Sample description 1',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)),
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(hours: 2)),
        emode: EventMode.ONLINE,
        etype: EventType.EVENT,
      ),
    ]);
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
        events = result!.events;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
  }
}
