import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:mobile_events_app/controller/services/event_services.dart';

import '../../constants.dart';

class CreateGroupServices {
  final ProviderRef ref;

  CreateGroupServices(this.ref);
  Future<ResModel> createGroup({required String title}) async {
    try {
      final token = await getToken(ref);

      Response response = await post(
        Uri.parse("$BASE_URL/groups"),
        headers: <String, String>{
          "accept": "application/json",
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer ${token.token}",
        },
        body: jsonEncode({"title": title}),
      );
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        final result = jsonDecode(response.body);

        return ResModel(
            status: "success", errMessage: result["group"]["title"]);
      } else {
        final result = jsonDecode(response.body);
        return ResModel(status: "failed", errMessage: result["message"]);
      }
    } catch (e) {
      return ResModel(status: "failed", errMessage: "An error occured");
    }
  }
}

final createGroupProvider =
    Provider<CreateGroupServices>((ref) => CreateGroupServices(ref));
final createGroupResponse = StateProvider.autoDispose<ResModel?>((ref) => null);

final createGroup =
    FutureProvider.autoDispose.family<bool, String>((ref, arg) async {
  final fetchdata = await ref.read(createGroupProvider).createGroup(title: arg);
  final isAuth = fetchdata.status == "success";
  if (isAuth) {
    ref.read(createGroupResponse.notifier).state = fetchdata;
  } else {
    ref.read(createGroupResponse.notifier).state = fetchdata;
  }
  return true;
});
