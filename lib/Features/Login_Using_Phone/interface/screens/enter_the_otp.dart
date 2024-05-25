import 'package:flutter/material.dart';

import '../widget/all_widget.dart';

class INSERTOTP extends StatelessWidget {
  const INSERTOTP({super.key});

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
