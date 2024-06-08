import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
/*
class PHONEAUTH extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

//استدعي هذه الداله بعد ادخال رقم الهاتف ليتم بعدها ارسال الكود
  sendCode(BuildContext context, String phoneNumberForVerify) async {
    print(
        '-------------------------------------start send code ----------------------------------------------');
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumberForVerify,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // ignore: use_build_context_synchronously
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
         print(
            'Verification failed: erore show------------------------------------------');
      /*  showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('pleas try agin'),
            );
          },
        );*/
        // });
      },
    );
  }

//يتم استدعاء هذه الداله بعد ادخال الكود للتحقق منه
  void verifyCode(String smsCode, BuildContext context) async {
    print('-----------------------------start virfiy.-----------------------------------------------------------..');
    if (verificationId != null) {
      print('-----------------------------if-----------------------------------------------------------..');
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );

      try {
        print('-----------------------------Attempting to sign in.-----------------------------------------------------------..');
        await _auth.signInWithCredential(credential);
        print('--------------------------Sign in successful, checking user status.-----------------------------..');
        // التحقق من حالة المستخدم بعد تسجيل الدخول
       // checkUserStatus(context);
      } catch (e) {
        // التعامل مع أي أخطاء تحدث هنا
        print('-------------------------------Error: $e-------------------------------------------------');
      }
    } else {
      print('-----------------------------Verification ID is null-------------------------------------');
    }
  }

  void checkUserStatus(BuildContext context) {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.metadata.creationTime == user.metadata.lastSignInTime) {
        print('User is new');
        if (Navigator.of(context).mounted) {
          Navigator.of(context).pushReplacementNamed('/');
        }
      } else {
        print('User is existing');
        if (Navigator.of(context).mounted) {
          Navigator.of(context).pushReplacementNamed('/mainscreen');
        }
      }
    } else {
      print('No user is currently signed in');
    }
  }

  void logout(BuildContext context) async {
    print(
        '-------------------------------------start lgout ----------------------------------------------');
    await _auth.signOut();
    print('logout');
    context.go('/');
  }
}
*/

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
