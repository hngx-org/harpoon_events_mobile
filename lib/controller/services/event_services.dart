import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harpoon_events_app/controller/services/auth_services.dart';
import 'package:harpoon_events_app/model/userDataModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../model/event_model.dart';
import '../../model/user_model.dart';

class EventServices {
  final ProviderRef ref;
  String eventEndpoint = 'http://web-01.okoth.tech/api/v1/events/';

  EventServices({required this.ref});

  Future<CreateEventResModel> createEvent(
    Map<String, dynamic> resData,
  ) async {
    final token = await getToken(ref);
    Response response = await post(
      Uri.parse("$eventEndpoint/"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer ${token.token}",
      },
      body: jsonEncode(resData),
    );
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);

      return CreateEventResModel(
        status: result["status"],
        errMessage: null,
      );
    } else {
      final result = jsonDecode(response.body);
      return CreateEventResModel(
        status: result["status"],
        errMessage: result["error"]["message"],
      );
    }
  }

  Future<List<EventModel>> getEvents() async {
    final token = await getToken(ref);

    Response response = await get(
      Uri.parse("$eventEndpoint/"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer ${token.token}",
      },
    );
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['events'];

      return result.map((data) => EventModel.fromJson(data)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final createEventResponse = StateProvider.autoDispose<CreateEventResModel?>((ref) => null);

final createEvent = FutureProvider.autoDispose.family<bool, Map<String, dynamic>>((ref, arg) async {
  final fetchdata = await ref.read(eventServiceProvider).createEvent(arg);
  final isAuth = fetchdata.status == "success";

  if (isAuth) {
    ref.read(createEventResponse.notifier).state = fetchdata;
  } else {
    ref.read(createEventResponse.notifier).state = fetchdata;
  }

  return true;
});

Future<UserDataModel> getToken(ProviderRef ref) async {
  final data = await ref.read(getUserDataProvider.future);
  return data;
}

final eventServiceProvider = Provider<EventServices>((ref) => EventServices(ref: ref));

class CreateEventResModel {
  final String? status;
  final String? errMessage;

  CreateEventResModel({required this.status, required this.errMessage});
}
