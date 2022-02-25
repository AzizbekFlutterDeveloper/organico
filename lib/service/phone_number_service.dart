import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

class PhoneService {
  static final _firebaseInit = Firebase.initializeApp();
  static PhoneAuthCredential? phoneCredential;

  static String verificationId1 = "";

  static TextEditingController phoneController = TextEditingController();
  static TextEditingController smsController = TextEditingController();

  static TextEditingController userController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static Future codesent(context) async {
    phoneCredential = PhoneAuthProvider.credential(
      verificationId: verificationId1,
      smsCode: smsController.text,
    );

    AuthService.authUser.signInWithCredential(phoneCredential!).then(
      (value) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      },
    );
  }

  static Future sendSms(context) async {
    AuthService.authUser.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (v) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Verification is completed !!!"),
          ),
        );
      },
      verificationFailed: (v) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Verifiction Faild !!!"),
          ),
        );
        print("$v");
      },
      codeSent: (verificationId, resentToken) async {
        verificationId1 = verificationId;
      },
      codeAutoRetrievalTimeout: (v) {},
    );
  }
}
