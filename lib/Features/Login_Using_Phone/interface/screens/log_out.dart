import 'package:flutter/material.dart';
import 'package:login_using_phone/Features/Login_Using_Phone/interface/widget/all_widget.dart';
import 'package:login_using_phone/Features/Login_Using_Phone/logic/all_logic.dart';

class MIANSCREEN extends StatelessWidget {
  const MIANSCREEN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: nextButton(
          context,
          "LOGOUT",
          () => LOGICLOGIN.logout(context),
        ),
      ),
    );
  }
}
