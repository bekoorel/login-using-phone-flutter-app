import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_using_phone_v2/Features/login/logic/firebase_phone_auth.dart';

class LOGICLOGIN {
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

class COUNTEROTP extends Notifier<dynamic> {
  String tcounter = '0';

  @override
  build() {
    return tcounter;
  }

  void increment() {
    tcounter = 'done';
    state = tcounter;
  }
}
