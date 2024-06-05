import 'package:flutter/material.dart';
import 'package:login_using_phone_v2/core/colors/colors.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

Widget insertNaumber(BuildContext context, controllerphone) {
  return Container(
    margin: const EdgeInsets.all(15),
    child: TextField(
      controller: controllerphone,
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    ),
  );
}

Widget nextButton(BuildContext context, textchild, Function dosomsing) {
  return Container(
    height: MediaQuery.of(context).size.height / 10,
    width: MediaQuery.of(context).size.width / 4,
    margin: const EdgeInsets.all(8),
    child: ElevatedButton(
      onPressed: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          dosomsing();
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: COLORS.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        textchild,
        style: TextStyle(
          color: COLORS.white,
        ),
      ),
    ),
  );
}

Widget insertOTP(BuildContext context) {
  return OTPTextField(
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
    onChanged: (value) {},
  );
}
