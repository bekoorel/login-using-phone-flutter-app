import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_using_phone_v2/Features/login/logic/all_logic.dart';
import 'package:login_using_phone_v2/Features/login/logic/providers.dart';
import 'package:login_using_phone_v2/core/colors/colors.dart';

import '../widget/all_widget.dart';

// ignore: must_be_immutable
class INSERTOTP extends ConsumerStatefulWidget {
  const INSERTOTP({super.key});

  @override
  ConsumerState<INSERTOTP> createState() => _INSERTOTPState();
}

class _INSERTOTPState extends ConsumerState<INSERTOTP> {


  LOGICLOGIN logiclogin = LOGICLOGIN();

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(countdownProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: insertOTP(context)),
          Text(
            '$count',
            style: TextStyle(color: COLORS.black),
          ),
         nextButton(
            context,
            "DONE",
            () => ref
                .read(countdownProvider.notifier)
                .increment() /*logiclogin.submentotp(context, otp.toString())*/,
          ),
        ],
      ),
    );
  }
}
