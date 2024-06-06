import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_using_phone_v2/core/colors/colors.dart';
import 'package:login_using_phone_v2/features/login/login_logic/providers.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

Widget insertOTP(BuildContext context) {
  return Consumer(
    builder: (context, ref, child) => OTPTextField(
        length: 6,
        width: MediaQuery.of(context).size.width / 1.1,
        fieldWidth: 50,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 25),
        textFieldAlignment: MainAxisAlignment.spaceEvenly,
        fieldStyle: FieldStyle.box,
        outlineBorderRadius: 22.0,
        otpFieldStyle: OtpFieldStyle(
          backgroundColor: COLORS.greenAccent,
          borderColor: COLORS.blueAccent,
        ),
        // onCompleted: (pin) {},
        // controller: otpController,

        onCompleted: (value) {
          print('-----------------------$value -------------------------');
          ref.read(fireBaseLogin).verifyCode(value, context);
        }),
  );
}
