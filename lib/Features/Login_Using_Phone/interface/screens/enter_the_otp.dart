import 'package:flutter/material.dart';
import 'package:login_using_phone_v2/Features/Login_Using_Phone/logic/all_logic.dart';

import '../widget/all_widget.dart';

// ignore: must_be_immutable
class INSERTOTP extends StatelessWidget {
  INSERTOTP({super.key});
  final TextEditingController otp = TextEditingController();

  LOGICLOGIN logiclogin =LOGICLOGIN();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: insertOTP(context, otp)),
          nextButton(
            context,
            "DONE",
            () => logiclogin.submentotp(context,otp.text ),
          ),
        ],
      ),
    );
  }
}
