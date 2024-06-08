import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
          enabledBorderColor: COLORS.blueAccent,
          backgroundColor: COLORS.gray.withOpacity(0.2),
          borderColor: COLORS.blueAccent,
        ),
     

        onCompleted: (value) {
          ref.read(fireBaseLogin).signInWithSmsCode(value);
          context.go('/mainscreen');
        }),
  );
}
