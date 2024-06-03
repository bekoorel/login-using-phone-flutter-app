import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_using_phone_v2/Features/Login_Using_Phone/logic/all_logic.dart';
import 'package:login_using_phone_v2/colors/colors.dart';
import 'package:otp_text_field/otp_field.dart';

import '../widget/all_widget.dart';

// ignore: must_be_immutable
class INSERTOTP extends ConsumerWidget {
  INSERTOTP({super.key});
  final OtpFieldController otp = OtpFieldController();

  LOGICLOGIN logiclogin = LOGICLOGIN();
  
 
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final counter = ref.watch(countdownProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: insertOTP(context, otp)),
          Text(
           /* counter > 0 ?*/ '$counter'/* : 'done'*/,
            style: TextStyle(color: COLORS.black),
          ),
          nextButton(
            context,
            "DONE",
            () => logiclogin.submentotp(context, otp.toString()),
          ),
        ],
      ),
    );
  }
}
