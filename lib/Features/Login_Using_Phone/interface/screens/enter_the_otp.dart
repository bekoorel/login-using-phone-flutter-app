import 'package:flutter/material.dart';

import '../widget/all_widget.dart';

class INSERTOTP extends StatefulWidget {
  const INSERTOTP({super.key});

  @override
  State<INSERTOTP> createState() => _INSERTOTPState();
}

class _INSERTOTPState extends State<INSERTOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          insertOTP(context),
        ],
      ),
    );
  }
}
