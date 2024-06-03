import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_using_phone_v2/Features/Login_Using_Phone/logic/firebase_phone_auth.dart';

class LOGICLOGIN {
  PHONEAUTH phoneauthclass = PHONEAUTH();

  submentPhone(BuildContext context, String phone) async{
   
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

final countdownProvider = StateNotifierProvider<COUNTEROTP,dynamic>((ref) {
  return COUNTEROTP();
});


class COUNTEROTP extends StateNotifier{
   COUNTEROTP(): super(0);

  int tcounter = 60;
  Timer? _timer;

  void initState() {
    _startTimer();
  }

   _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (tcounter > 0) {
        tcounter--;
      } else {
        _timer?.cancel();
      //  tcounter==0;
      }
    
    });
  }

}