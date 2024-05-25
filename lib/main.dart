import 'package:flutter/material.dart';

import 'interface/screens/enter_your_phone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home:  EnterYourPhone() ,
    );
  }
}
