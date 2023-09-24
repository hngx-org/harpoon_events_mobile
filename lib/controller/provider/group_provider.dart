import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/group_model.dart';
import '../services/group_services.dart';

final groupServiceProvider =
    Provider<GroupServices>((ref) => GroupServices(ref: ref));

// State variable for holding the selected Event.
final selectedGroupProvider = StateProvider<GroupModel?>((ref) => null);

// GET ALL GROUPS Logic under here...
//
//
final allGroupsProvider = FutureProvider<List<GroupModel>>((ref) async {
  return ref.watch(groupServiceProvider).getGroups();
});

// GET SINGLE GROUP Logic under here...
//
//
final getSingleGroup =
    FutureProvider.autoDispose.family<GroupModel, String>((ref, groupId) async {
  return ref.watch(groupServiceProvider).getSingleGroup(groupId);
});

// CREATE GROUP Logics under here....
//
//
class CreateGroupResModel {
  final String? status;
  final String? errMessage;

  CreateGroupResModel({required this.status, required this.errMessage});
}

// The StateProvider variable that we'll watch for group creation status
final createGroupResponse =
    StateProvider.autoDispose<CreateGroupResModel?>((ref) => null);

// A function that call creates groups on call
// Returns a FutureProvider so we can track it's status.
final createGroup = FutureProvider.autoDispose.family<bool, String>(
  (ref, arg) async {
    final resData = <String, String>{
      "title": arg,
    };

    final fetchdata = await ref.read(groupServiceProvider).createGroup(resData);
    final isAuth = fetchdata.status == "success";

    if (isAuth) {
      ref.read(createGroupResponse.notifier).state = fetchdata;
    } else {
      ref.read(createGroupResponse.notifier).state = fetchdata;
    }

    return true;
  },
);
