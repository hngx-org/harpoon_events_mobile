import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/group_model.dart';
import '../services/group_services.dart';

// Request to get all groups
final allGroupsProvider = FutureProvider<List<GroupModel>>((ref) async {
  return ref.watch(groupServiceProvider).getGroups();
});

// A function that call creates groups on call
// Returns a FutureProvider so we can track it's status.
FutureProvider<GroupModel> createGroupProvider(String title) {
  final resData = <String, String>{
    "title": title,
  };

  return FutureProvider<GroupModel>((ref) async {
    return ref.watch(groupServiceProvider).createGroup(resData);
  });
}

// State variable to hold all the groups that are available in the DB
final groupsDataProvider = StateProvider<List<GroupModel>?>((ref) => null);
final selectedGroupProvider = StateProvider<GroupModel?>((ref) => null);
