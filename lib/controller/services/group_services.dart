import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../model/group_model.dart';

class GroupServices {
  String groupsEndpoint = 'http://web-01.okoth.tech/api/v1/groups/';

  // Get all groups
  Future<List<GroupModel>> getGroups() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppStrings.tokenKey);

    Response response = await get(
      Uri.parse("$groupsEndpoint/"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['groups'];

      return result.map((data) => GroupModel.fromJson(data)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  // Create a group
  Future<GroupModel> createGroup(Map<String, dynamic> resData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppStrings.tokenKey);

    Response response = await post(
      Uri.parse("$groupsEndpoint/"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(resData),
    );

    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);

      return GroupModel.fromJson(result['dataValues']);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final groupServiceProvider = Provider<GroupServices>((ref) => GroupServices());
