import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../model/group_model.dart';
import '../../model/userDataModel.dart';
import '../provider/group_provider.dart';
import 'auth_services.dart';

class GroupServices {
  final ProviderRef ref;

  String groupsEndpoint = 'http://web-01.okoth.tech/api/v1/groups/';

  GroupServices({required this.ref});

  Future<UserDataModel> getToken(ProviderRef ref) async {
    // Get the data of the future events
    final data = await ref.read(getUserDataProvider.future);

    return data;
  }

  // Get all groups
  Future<List<GroupModel>> getGroups() async {
    final token = await getToken(ref);

    Response response = await get(
      Uri.parse("$groupsEndpoint/"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer ${token.token}",
      },
    );

    log(response.body);
    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['groups'];

      return result.map((data) => GroupModel.fromJson(data)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  // Get a single group
  Future<GroupModel> getSingleGroup(String groupId) async {
    final token = await getToken(ref);

    Response response = await get(
      Uri.parse("$groupsEndpoint/$groupId"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer ${token.token}",
      },
    );

    log(response.body);
    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final Map<String, dynamic> result = jsonDecode(response.body)['group'];

      return GroupModel.singleFromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  // Create a group
  Future<CreateGroupResModel> createGroup(Map<String, dynamic> resData) async {
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

    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);

      return CreateGroupResModel(
        status: result["status"],
        errMessage: null,
      );
    } else {
      final result = jsonDecode(response.body);
      return CreateGroupResModel(
        status: result["status"],
        errMessage: result["error"]["message"],
      );
    }
  }
}
