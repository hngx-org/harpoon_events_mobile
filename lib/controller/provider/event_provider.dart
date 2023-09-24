import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/event_model.dart';
import '../services/event_services.dart';

// The provider that brings our EventsServices here.
final eventServiceProvider =
    Provider<EventServices>((ref) => EventServices(ref: ref));

// State variable for holding the selected Event.
final selectedEventProvider = StateProvider<EventModel?>((ref) => null);

// CREATE EVENT Logics under here....
//
//
class CreateEventResModel {
  final String? status;
  final String? errMessage;

  CreateEventResModel({required this.status, required this.errMessage});
}

final createEventResponse =
    StateProvider.autoDispose<CreateEventResModel?>((ref) => null);

// The function that gets called from the UI
final createEvent = FutureProvider.autoDispose
    .family<bool, Map<String, dynamic>>((ref, arg) async {
  final fetchdata = await ref.read(eventServiceProvider).createEvent(arg);
  final isAuth = fetchdata.status == "success";

  if (isAuth) {
    ref.read(createEventResponse.notifier).state = fetchdata;
  } else {
    ref.read(createEventResponse.notifier).state = fetchdata;
  }

  return true;
});

// GET EVENTS Logics under here....
//
//
final allEventsProvider = FutureProvider<List<EventModel>>((ref) async {
  return ref.watch(eventServiceProvider).getEvents();
});

// GET SINGLE EVENT Logic under here...
//
//
final getSingleEvent =
    FutureProvider.autoDispose.family<EventModel, String>((ref, eventId) async {
  return ref.watch(eventServiceProvider).getSingleEvent(eventId);
});
