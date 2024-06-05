import 'package:flutter/material.dart';
import 'package:login_using_phone_v2/Features/login/interface/widget/all_widget.dart';
import 'package:login_using_phone_v2/Features/login/logic/all_logic.dart';

// ignore: must_be_immutable
class MIANSCREEN extends StatelessWidget {
   MIANSCREEN({super.key});
LOGICLOGIN logiclogin =LOGICLOGIN();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: nextButton(
          context,
          "LOGOUT",
          () => logiclogin.logout(context),
        ),
      ),
    );
  }
}
