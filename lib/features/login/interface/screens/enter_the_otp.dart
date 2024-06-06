import 'package:flutter/material.dart';

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
            child: insertOTP(
              context,
            ),
          ),
        ],
      ),
    );
  }
}
