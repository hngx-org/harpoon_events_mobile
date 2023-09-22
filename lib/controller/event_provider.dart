import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/event_model.dart';
import 'services/event_services.dart';

final eventsProvider = FutureProvider<List<EventModel>>((ref) async {
  return ref.watch(eventServiceProvider).getEvents();
});
final evenDataProvider = StateProvider<List<EventModel>?>((ref) => null);
