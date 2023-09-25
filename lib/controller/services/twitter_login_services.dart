import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_events_app/constants.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterServices {
  Future<AuthResult> loginTwitterUser() async {
    try {
      final twitterLogin = TwitterLogin(
        apiKey: TwitterKeys.API_KEY,
        apiSecretKey: TwitterKeys.API_SECRET_KEY,
        redirectURI: 'teamharpoon://',
      );

      final authResult = await twitterLogin.login(forceLogin: true);

      log(authResult.status.toString());
      if (authResult.status == TwitterLoginStatus.loggedIn) {
        return AuthResult(
          status: authResult.status!,
          authToken: authResult.authToken,
          authTokenSecret: authResult.authTokenSecret,
          errorMessage: authResult.errorMessage,
          user: authResult.user,
        );
      } else if (authResult.status == TwitterLoginStatus.cancelledByUser) {
        return AuthResult(
          status: authResult.status!,
          authToken: authResult.authToken,
          authTokenSecret: authResult.authTokenSecret,
          errorMessage: authResult.errorMessage,
          user: authResult.user,
        );
      } else {
        return AuthResult(
          status: authResult.status!,
          authToken: authResult.authToken,
          authTokenSecret: authResult.authTokenSecret,
          errorMessage: authResult.errorMessage,
          user: authResult.user,
        );
      }
    } catch (e) {
      log(e.toString());
      return AuthResult(
        status: TwitterLoginStatus.error,
        authToken: "",
        authTokenSecret: "",
        errorMessage: "An error occured, please try again later",
      );
    }
  }
}

final twitterServiceProvider = Provider.autoDispose<TwitterServices>((ref) {
  return TwitterServices();
});

final loginTwitterResponse =
    StateProvider.autoDispose<AuthResult?>((ref) => null);

final getData = FutureProvider.autoDispose<AuthResult>((ref) async {
  final fetchdata = await ref.read(twitterServiceProvider).loginTwitterUser();
  final isAuth = fetchdata.status == TwitterLoginStatus.loggedIn;

  if (isAuth) {
    ref.read(loginTwitterResponse.notifier).state = fetchdata;
  } else {
    ref.read(loginTwitterResponse.notifier).state = fetchdata;
  }

  return fetchdata;
});
