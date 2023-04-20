// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:recipe_app/auth/login_screen.dart';
import 'package:recipe_app/components/error_widget.dart';
import 'package:recipe_app/screens/bottomnav_screen.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // Email Sign Up
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      myErrorMessage(context, e.message!);
    }
  }

  // Email Login
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        myErrorMessage(context, "Email is not verified");
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomnavScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      myErrorMessage(context, e.message!);
    }
  }

  // Email Verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      String? email = _auth.currentUser?.email;
      myErrorMessage(context, "Email Verification link send to $email");
    } on FirebaseAuthException catch (e) {
      myErrorMessage(context, e.message!);
    }
  }

  // Google Sign In
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // if (userCredential.user != null) {
        //   if (userCredential.additionalUserInfo!.isNewUser) {

        //   }

        // }
      }
    } on FirebaseAuthException catch (e) {
      myErrorMessage(context, e.message!);
    }
  }
}
