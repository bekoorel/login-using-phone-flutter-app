import 'package:flutter/material.dart';

import '../interface/screens/enter_the_otp.dart';

class SCREENLOGIC {
  static submentPhone(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const INSERTOTP();
        },
      ),
    );
  }
}
