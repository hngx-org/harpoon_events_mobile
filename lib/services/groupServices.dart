import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harpoon_events_app/constants.dart';
import 'package:harpoon_events_app/controller/services/event_services.dart';
import 'package:harpoon_events_app/model/groupListModel.dart';
import 'package:http/http.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

class GroupServices {
  final ProviderRef ref;

  GroupServices({required this.ref});
  Future<List<Group>> getGroup() async {
    try {
      final token = await getToken(ref);

      Response response = await get(
        Uri.parse("$BASE_URL/groups"),
        headers: <String, String>{
          "accept": "application/json",
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer ${token.token}",
        },
      );
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body)["groups"];

        return List.from(result).map((e) => Group.fromJson(e)).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

final getGroupListProvider = Provider<GroupServices>((ref) => GroupServices(ref: ref));

final getGroup = FutureProvider<List<Group>>((ref) async {
  return ref.watch(getGroupListProvider).getGroup();
});
