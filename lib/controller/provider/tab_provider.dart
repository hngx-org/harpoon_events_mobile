import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TabState {
  timeline,
  myPeople,
  calendar,
  settings,
  createEvent,
}

final tabProvider = StateProvider<TabState>((ref) => TabState.timeline);
