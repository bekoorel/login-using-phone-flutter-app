import 'package:flutter/material.dart';
import 'package:login_using_phone/colors/colors.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../logic/all_logic.dart';

Widget insertNaumber(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(15),
    child: const TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    ),
  );
}

Widget nextButton(BuildContext context) {
  return 
   ElevatedButton(
          onPressed: () {
                  // هنا يمكنك إضافة أي إجراء ترغب فيه عند الضغط على الزر
                          SCREENLOGIC.submentPhone(context);
                                },
                                      style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white, backgroundColor: Colors.black, // لون النص
                                                              shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(16.0), // الجوانب المنحنية
                                                                                ),
                                                                                        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // padding لإعطاء الزر شكلاً مربعاً
                                                                                              ),
                                                                                                    child: Text(
                                                                                                            'Next',
                                                                                                                    style: TextStyle(
                                                                                                                              color: Colors.white,
                                                                                                                                      ),
                                                                                                                                            ),
                                                                                                                                                );
   
   /*Inkwell ()
   onTap: SCREENLOGIC.submentPhone(context),
    child: Container(alignment: Alignment.center,
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 9,
      decoration: BoxDecoration(
          color: COLORS.black, borderRadius: BorderRadius.circular(10)),
      child: Text(
        'Next',
        style: TextStyle(color: COLORS.white,fontSize: 25),
      ),
    ),
  );*/
}

Widget insertOTP(BuildContext context){
  return OTPTextField(
  length: 5,
  width: MediaQuery.of(context).size.width,
  fieldWidth: 80,
  style: const TextStyle(
    fontSize: 17
  ),
  textFieldAlignment: MainAxisAlignment.spaceAround,
  fieldStyle: FieldStyle.underline,
  onCompleted: (pin) {
  },
);
} 