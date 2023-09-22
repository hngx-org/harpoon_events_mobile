import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/event_model.dart';
import 'services/event_services.dart';

// Request to get all groups
final allEventsProvider = FutureProvider<List<EventModel>>((ref) async {
  return ref.watch(eventServiceProvider).getEvents();
});

// State variable to hold all the groups that are available in the DB
final eventDataProvider = StateProvider<List<EventModel>?>((ref) => null);

// State variable for holding the selected Event.
final selectedEventProvider = StateProvider<EventModel?>((ref) => null);
