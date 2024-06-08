import 'package:flutter/material.dart';

import '../widget/single_widget.dart';

// ignore: must_be_immutable
class INSERTOTP extends StatefulWidget {
  const INSERTOTP({super.key});

  @override
  State<INSERTOTP> createState() => _INSERTOTPState();
}

class _INSERTOTPState extends State<INSERTOTP> {
  //LOGICLOGIN logiclogin = LOGICLOGIN();
  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Enter the code sent to you in a sms',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 11,
          ),
          Center(
            child: insertOTP(
              context,
            ),
          ),
        ],
      ),
    );
  }
}
