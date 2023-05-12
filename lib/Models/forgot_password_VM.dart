import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  String message = "";
  Future<bool> resetPassword(String email) async {
    bool emailSent = false;

    try {
     final credits = FirebaseAuth.instance.sendPasswordResetEmail(email: email);
     emailSent= credits != null;
    } on FirebaseAuthException catch (e) {
      message = e.code;
      notifyListeners();
    } catch (e) {
      print(e);
    }

    return emailSent;
  }
}