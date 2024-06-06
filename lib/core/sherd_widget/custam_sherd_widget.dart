import 'package:flutter/material.dart';
import 'package:login_using_phone_v2/core/colors/colors.dart';

Widget custamTextFild(BuildContext context, controllerphone) {
  return Container(
    margin: const EdgeInsets.all(15),
    child: TextField(
      autofocus: true,
      controller: controllerphone,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    ),
  );
}

Widget castamButton(BuildContext context, textchild, Function dosomsing) {
  return Container(
    height: MediaQuery.of(context).size.height / 10,
    width: MediaQuery.of(context).size.width / 4,
    margin: const EdgeInsets.all(8),
    child: ElevatedButton(
      onPressed: () {
        dosomsing();
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
