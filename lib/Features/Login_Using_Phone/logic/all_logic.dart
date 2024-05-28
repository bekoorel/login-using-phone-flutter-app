import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_using_phone_v2/Features/Login_Using_Phone/logic/firebase_phone_auth.dart';

class LOGICLOGIN {
  PHONEAUTH phoneauthclass = PHONEAUTH();

  submentPhone(BuildContext context, String phone) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneauthclass.sendCode(phone);
     // context.go('/INSERTOTP');
    });
  }

  submentotp(BuildContext context,String smsCode) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneauthclass.verifyCode(smsCode);
      context.go('/mainscreen');
    });
  }

  logout(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneauthclass.logout();
      context.go('/');
    });
  }
}
