import 'package:flutter/material.dart';
import 'package:login_using_phone/colors/colors.dart';

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
  return InkWell(
    onTap: SCREENLOGIC.submentPhone(),
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
  );
}
