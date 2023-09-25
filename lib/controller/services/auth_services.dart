// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../model/user_data_model.dart';
import '../../model/user_model.dart';

class AuthServices {
  String userEndpoint = 'http://web-01.okoth.tech/api/v1/users';

  Future<LoginResponse> authorizeUser(
      {required LoginDataModel loginData}) async {
    try {
      Response response = await post(
        Uri.parse("$userEndpoint/${loginData.source}"),
        headers: <String, String>{
          "accept": "application/json",
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "name": loginData.name ?? "",
          "email": loginData.email ?? "",
          "avatar": loginData.avatar ?? AppStrings.profilePicture,
        }),
      );
      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
      if (response.statusCode == 201) {
        final result = jsonDecode(response.body);
        UserDataModel body = UserDataModel.fromJson(result);
        // Obtain shared preferences.
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppStrings.tokenKey, result['token']);

        return LoginResponse(
          status: result["status"],
          errMessage: null,
          body: body,
        );
      } else {
        final result = jsonDecode(response.body);
        return LoginResponse(
          status: result["status"],
          errMessage: result["errors"][0]["message"],
          body: null,
        );
      }
    } catch (e) {
      log(e.toString());
      return LoginResponse(
        status: "error",
        errMessage: "An unexpected error occured",
        body: null,
      );
    }
  }

  Future<UserModel> getUser(String userId, String token) async {
    Response response = await get(
      Uri.parse("$userEndpoint/$userId"),
      headers: <String, String>{
        "accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);

      return UserModel.fromJson(result['user']);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final authProvider = Provider<AuthServices>((ref) => AuthServices());

final loginResponseProvider =
    StateProvider.autoDispose<LoginResponse?>((ref) => null);

final loginProvider = FutureProvider.family<bool, LoginDataModel>(
  (ref, authArgs) async {
    return Future.delayed(const Duration(seconds: 2), () async {
      final authResponse = await ref.watch(authProvider).authorizeUser(
            loginData: authArgs,
          );
      final isAuthenticated = authResponse.body!.status == "success";
      if (isAuthenticated) {
        ref.read(loginResponseProvider.notifier).state = authResponse;

        ref.read(setIsAuthenticatedProvider(isAuthenticated));
        final userData = jsonEncode(authResponse.body!.toJson());
        ref.read(setUserDataProvider(userData));
      } else {
        ref.read(loginResponseProvider.notifier).state = authResponse;
      }

      return isAuthenticated;
    });
  },
);
const IS_AUTHENTICATED = "IS_AUTHENTICATED";
const USER_DATA = "USER_DATA";
final sharedPrefprovider = Provider(
  (ref) async {
    return await SharedPreferences.getInstance();
  },
);

final setIsAuthenticatedProvider = StateProvider.autoDispose.family<void, bool>(
  (ref, isAuth) {
    Future.delayed(Duration.zero, () async {
      final prefs = await ref.watch(sharedPrefprovider);
      ref.watch(loginResponseProvider);
      prefs.setBool(IS_AUTHENTICATED, isAuth);
    });
  },
);

final getIsAuthenticatedProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final prefs = await ref.watch(sharedPrefprovider);
    ref.watch(loginResponseProvider);
    return prefs.getBool(IS_AUTHENTICATED) ?? false;
  },
);

final setUserDataProvider = StateProvider.autoDispose.family<void, String>(
  (ref, userData) async {
    final prefs = await ref.watch(sharedPrefprovider);
    ref.watch(loginResponseProvider);
    prefs.setString(
      USER_DATA,
      userData,
    );
  },
);

final getUserDataProvider = FutureProvider.autoDispose<UserDataModel>(
  (ref) async {
    final prefs = await ref.watch(sharedPrefprovider);
    ref.watch(loginResponseProvider);

    final data = prefs.getString(USER_DATA) ?? "";

    final userDatas = UserDataModel.fromJson(jsonDecode(data));

    return userDatas;
  },
);

final clearCredentialsProvider = FutureProvider.autoDispose<bool>((ref) async {
  final prefs = await ref.watch(sharedPrefprovider);

  try {
    if (prefs.containsKey(IS_AUTHENTICATED)) {
      await prefs.remove(IS_AUTHENTICATED);
    }

    if (prefs.containsKey(USER_DATA)) {
      await prefs.remove(USER_DATA);
    }

    // Credentials cleared successfully

    return true;
  } catch (e) {
    log("Error while clearing saved credentials: $e");
    return false; // Failed to clear credentials
  }
});

final logoutstate = StateProvider<String?>((ref) => null);

class LoginResponse {
  final String? status;
  final String? errMessage;
  final UserDataModel? body;

  LoginResponse(
      {required this.status, required this.errMessage, required this.body});
}

class LoginDataModel {
  final String? name;
  final String? email;
  final String? avatar;
  final String? source;

  LoginDataModel(
      {required this.name,
      required this.email,
      required this.avatar,
      required this.source});
}
