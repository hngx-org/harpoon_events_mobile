import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harpoon_events_app/controller/services/auth_services.dart';

final googleProvider = Provider<GoogleService>(
  (ref) => GoogleService(googleSignIn: GoogleSignIn()),
);

final googleData = StateProvider<LoginDataModel?>((ref) => null);

class GoogleService {
  final GoogleSignIn _googleSignIn;

  GoogleService({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  Future<void> signInWithGoogle(WidgetRef ref) async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        log(user.email);
        log(user.displayName!);
        log(user.photoUrl!);
      }

      ref.read(googleData.notifier).state = LoginDataModel(
        name: user!.displayName,
        email: user.email,
        avatar: user.photoUrl,
        source: "google",
      );
    } catch (e) {
      log(e.toString());
      ref.read(googleData.notifier).state = LoginDataModel(
        name: e.toString(),
        email: "",
        avatar: "",
        source: "",
      );
    }
  }
}
