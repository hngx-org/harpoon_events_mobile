import 'package:event_app/view/screens/main_page.dart';
import 'package:event_app/view/screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth{
  // Auth state checks if user is logged in

  handleAuthState(){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot){
      if(snapshot.hasData){
        return const MainPage();
      }else{
        return const SignUpPage();
      }
    });
  }

  // Signing with google

  signInWithGoogle() async {
    try {
      // Authentication flow is triggered
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
          scopes: <String>["email"]).signIn();

      // Obtaining the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      // Creating a new user credentials
      final userCredentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Returning users credentials
      return await FirebaseAuth.instance.signInWithCredential(userCredentials);
    } on FirebaseAuthException catch(e){
      print('Error during Google Sign-In: $e');
    }

  }

  // Sign Out
  signOut(){
    FirebaseAuth.instance.signOut();
  }
}