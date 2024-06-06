import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PHONEAUTH extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

//استدعي هذه الداله بعد ادخال رقم الهاتف ليتم بعدها ارسال الكود
  sendCode(BuildContext context, String phoneNumberForVerify) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumberForVerify,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        checkUserStatus(context);
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
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('pleas try agin'),
            );
          },
        );
        // });
      },
    );
  }

//يتم استدعاء هذه الداله بعد ادخال الكود للتحقق منه
  void verifyCode(String smsCode, BuildContext context) async {
    if (verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      context.go('/mainscreen');
      // checkUserStatus(context);
    }
  }

//يتم استدعاء هذه الداله اذا كان المستخدم مسجل ام لا وتحويله
  void checkUserStatus(BuildContext context) {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.metadata.creationTime == user.metadata.lastSignInTime) {
        print('User is new');
        context.go('/');
      } else {
        print('User is existing');

        context.go('/mainscreen');
      }
    }
  }

  void logout(BuildContext context) async {
    await _auth.signOut();
    print('logout');
    context.go('/');
  }
}
