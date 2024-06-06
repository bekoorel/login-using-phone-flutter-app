import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_using_phone_v2/features/login/login_logic/firebase_phone_auth.dart';

class LOGICLOGIN  {
  PHONEAUTH phoneauthclass = PHONEAUTH();

  submentPhone(BuildContext context, String phone) async {
    // await  phoneauthclass.sendCode(phone,context);
    context.go('/INSERTOTP');
  }

  submentotp(BuildContext context, String smsCode) {
    // phoneauthclass.verifyCode(smsCode);
    context.go('/mainscreen');
  }

  logout(BuildContext context) {
    // phoneauthclass.logout();
    context.go('/');
  }
}

class COUNTEROTP extends ChangeNotifier {
  String tcounter = '0';

  void increment(v) {
    tcounter = v;
    notifyListeners();
  }
}
