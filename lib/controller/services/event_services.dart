import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:harpoon_events_app/controller/provider/event_provider.dart';
import 'package:harpoon_events_app/controller/services/auth_services.dart';

import 'package:harpoon_events_app/model/user_data_model.dart';
import 'package:harpoon_events_app/view/screens/create_event_page.dart';
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
        errMessage: result["message"],
      );
    }
  }

  Future<List<EventModel>> getEvents({String? eventId}) async {
   try{
 final token = await getToken(ref);

    Response response = await get(
      Uri.parse("$BASE_URL/events/$eventId"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer ${token.token}",
      },
    );
    debugPrint(eventId);
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['events'];

      return result.map((data) => EventModel.fromJson(data)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
   }catch( e){
    debugPrint(e.toString());
    rethrow;
   }
  }Future<EventModel> getSingleEvent(String eventId) async {
    final token = await getToken(ref);

    Response response = await get(
      Uri.parse("$eventEndpoint/$eventId"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer ${token.token}",
      },
    );
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body)['event'];

      return EventModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<CreateEventResModel> createComment({required Map<String, String> data}) async {
    try {
      final token = await getToken(ref);

      Response response = await post(
        Uri.parse("$eventEndpoint${data["eventid"]}/comments"),
        headers: <String, String>{
          "accept": "application/json",
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer ${token.token}",
        },
        body: jsonEncode({"body": data["body"]}),
      );
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 201) {
        // final result = jsonDecode(response.body);

        return CreateEventResModel(status: "success", errMessage: null);
      } else {
        final result = jsonDecode(response.body);
        return CreateEventResModel(status: "failed", errMessage: result["message"]);
      }
    } catch (e) {
      return CreateEventResModel(status: "failed", errMessage: "An error occured");
    }
  }
}

final eventServiceProvider = Provider<EventServices>((ref) => EventServices(ref: ref));
final createEventResponse = StateProvider.autoDispose<CreateEventResModel?>((ref) => null);
final createCommentResponse = StateProvider.autoDispose<CreateEventResModel?>((ref) => null);

final createComment = FutureProvider.autoDispose.family<bool, Map<String, String>>((ref, arg) async {
  final fetchdata = await ref.read(eventServiceProvider).createComment(data: arg);
  final isAuth = fetchdata.status == "success";

  if (isAuth) {
    ref.read(createCommentResponse.notifier).state = fetchdata;
  } else {
    ref.read(createCommentResponse.notifier).state = fetchdata;
  }

  return true;
});
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

final getEventProvider=FutureProvider.family<List<EventModel>, String>((ref, arg) {
 final fetchData= ref.watch(eventServiceProvider).getEvents(eventId: arg);
 return fetchData;
});
Future<UserDataModel> getToken(ProviderRef ref) async {
  final data = await ref.read(getUserDataProvider.future);
  return data;
}

class ResModel {
  final String? status;
  final String? errMessage;

  ResModel({required this.status, required this.errMessage});
}
