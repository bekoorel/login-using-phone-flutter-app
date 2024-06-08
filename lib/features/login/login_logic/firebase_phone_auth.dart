import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieve verification code
        print('----------------Auto-retrieve verification code--------------');
        await _auth.signInWithCredential(credential);
        print(
            '----------------Auto-retrieve verification code completed--------------');
      },
      verificationFailed: (FirebaseAuthException e) {
        // Verification failed
        print('----------------Verification failed--------------');
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Save the verification ID for future use
        print('----------------Code sent--------------');
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieve timeout
        print('----------------Auto-retrieve timeout--------------');
        _verificationId = verificationId;
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Future<void> signInWithSmsCode(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      print('----------------Sign in with credential completed--------------');
    } catch (e) {
      print('----------------Sign in with credential failed--------------');
      print(e.toString());
    }
  }
}
