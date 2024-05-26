import 'package:flutter/material.dart';
import 'package:login_using_phone/Features/Login_Using_Phone/logic/all_logic.dart';

import '../widget/all_widget.dart';

class INSERTOTP extends StatelessWidget {
  const INSERTOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: insertOTP(context)),
          nextButton(
            context,"DONE",
            () => LOGICLOGIN.submentotp(context),
          ),
        ],
      ),
    );
  }
}
