// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:harpoon_events_app/view/screens/main_page.dart';
// import 'package:harpoon_events_app/view/screens/signup_page.dart';

// class GoogleAuth {
//   // Auth state checks if user is logged in
//   handleAuthState() {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData) {
//           return const MainPage();
//         } else {
//           return const SignUpPage();
//         }
//       },
//     );
//   }

//   // Signing with google
//   signInWithGoogle() async {
//     try {
//       // Authentication flow is triggered
//       final GoogleSignInAccount? googleUser =
//           await GoogleSignIn(scopes: <String>["email"]).signIn();

//       // Obtaining the auth details from the request
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser!.authentication;

//       // Creating a new user credentials
//       final userCredentials = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Returning users credentials
//       return await FirebaseAuth.instance.signInWithCredential(userCredentials);
//     } on FirebaseAuthException catch (e) {
//       if (kDebugMode) {
//         print('Error during Google Sign-In: $e');
//       }
//     }
//   }

//   // Sign Out
//   signOut() {
//     FirebaseAuth.instance.signOut();
//   }
// }
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harpoon_events_app/constants.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';

class AuthServices {
  String userEndpoint = 'http://web-01.okoth.tech/api/v1/users';

  Future<UserModel> authorizeUser(
      String name, String email, String? avatar, String source) async {
    Response response = await post(
      Uri.parse("$userEndpoint/$source"),
      headers: <String, String>{
        "accept": "application/json",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": name,
        "email": email,
        "avatar": avatar ?? AppStrings.profilePicture,
      }),
    );

    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);

      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppStrings.tokenKey, result['token']);

      return UserModel.fromJson(result['dataValues']);
    } else {
      throw Exception(response.reasonPhrase);
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

      return UserModel.fromJson(result['dataValues']);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final authProvider = Provider<AuthServices>((ref) => AuthServices());
final userDataProvider = StateProvider<UserModel?>((ref) => null);
final tokenProvider = StateProvider.autoDispose<String?>((ref) => null);
