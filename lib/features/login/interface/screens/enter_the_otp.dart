import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:login_using_phone_v2/core/colors/colors.dart';
import 'package:login_using_phone_v2/core/sherd_widget/custam_sherd_widget.dart';
import 'package:login_using_phone_v2/features/login/login_logic/providers.dart';

import '../widget/single_widget.dart';

// ignore: must_be_immutable
class INSERTOTP extends StatelessWidget {
  const INSERTOTP({super.key});

  //LOGICLOGIN logiclogin = LOGICLOGIN();
  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer(
              builder: (context, ref, child) => insertOTP(
                context,
                ref.read(countdownProvider),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) => Text(
              ref.watch(countdownProvider).tcounter,
              style: TextStyle(color: COLORS.black),
            ),
          ),
          //SUPMENT_OTP
          Consumer(
            builder: (context, ref, child) => castamButton(
              context,
              "DONE",
              () => ref.read(countdownProvider).increment(
                  'not') /*logiclogin.submentotp(context, otp.toString())*/,
            ),
          ),
        ],
      ),
    );
  }
}
