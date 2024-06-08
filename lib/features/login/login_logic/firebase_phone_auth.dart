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
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Verification failed
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Save the verification ID for future use
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieve timeout
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
    } catch (e) {
      print(e.toString());
    }
  }
}

class AuthService extends PhoneAuth {
  // Check if the user is already signed in
  bool isUserLoggedIn() {
    final user = _auth.currentUser;
    if (user != null) {
      print('User is logged in: ${user.phoneNumber}');
      return true;
    } else {
      print('No user is logged in');
      return false;
    }
  }
}

class LOGEOUT extends PhoneAuth {
  Future logeOut() async {
    try {
      print('---------------------out-------------------');
      await _auth.signOut();
    } catch (e) {
      print('---------------------$e-------------------');
    }
  }
}
