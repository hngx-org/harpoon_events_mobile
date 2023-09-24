import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../../model/event_model.dart';
import '../../model/userDataModel.dart';
import '../event_provider.dart';
import 'auth_services.dart';

class EventServices {
  final ProviderRef ref;
  String eventEndpoint = 'http://web-01.okoth.tech/api/v1/events/';

  EventServices({required this.ref});

  Future<UserDataModel> getToken(ProviderRef ref) async {
    // Get the data of the future events
    final data = await ref.read(getUserDataProvider.future);

    return data;
  }

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
