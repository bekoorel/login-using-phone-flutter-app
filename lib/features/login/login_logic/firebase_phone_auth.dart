import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PHONEAUTH {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

//استدعي هذه الداله بعد ادخال رقم الهاتف ليتم بعدها ارسال الكود
   sendCode(phoneNumberForVerify, BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumberForVerify,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        checkUserStatus();
      },
      verificationFailed: (FirebaseAuthException e) {
        print(
            'Verification failed: ------------------------------------------');
        print('Verification failed: ${e.message}');
        print(
            'Verification failed: ------------------------------------------');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('${e.message}'),
            );
          },
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        // setState(() {
        verificationId = verificationId;
         context.go('/INSERTOTP');
        //  });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // setState(() {
        verificationId = verificationId;
        // });
      },
    );
  }

//يتم استدعاء هذه الداله بعد ادخال الكود للتحقق منه
  void verifyCode(String smsCode) async {
    if (verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);

      checkUserStatus();
    }
  }

//يتم استدعاء هذه الداله اذا كان المستخدم مسجل ام لا وتحويله
  void checkUserStatus() {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.metadata.creationTime == user.metadata.lastSignInTime) {
        //  print('User is new');
      } else {
        //print('User is existing');
        // Redirect to third page if user is existing
        /* Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ThirdPage()),
        );*/
      }
    }
  }

  void logout() async {
    await _auth.signOut();
    // Navigate back to phone number input screen
    // Navigator.pop(context);
  }
}
