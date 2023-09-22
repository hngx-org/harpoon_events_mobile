import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../model/event_model.dart';
import '../../model/user_model.dart';

class EventServices {
  String eventEndpoint = 'http://web-01.okoth.tech/api/v1/events/';

  Future<UserModel> createEvent(Map<String, dynamic> resData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppStrings.tokenKey);

    Response response = await post(
      Uri.parse("$eventEndpoint/"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(resData),
    );

    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);

      return UserModel.fromJson(result['dataValues']);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<EventModel>> getEvents() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppStrings.tokenKey);

    Response response = await get(
      Uri.parse("$eventEndpoint/"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['events'];

      return result.map((data) => EventModel.fromJson(data)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final eventServiceProvider = Provider<EventServices>((ref) => EventServices());
