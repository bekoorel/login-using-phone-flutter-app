import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_using_phone_v2/core/sherd_widget/custam_sherd_widget.dart';
import 'package:login_using_phone_v2/features/login/login_logic/providers.dart';

// ignore: must_be_immutable
class MIANSCREEN extends StatelessWidget {
  const MIANSCREEN({super.key});
//LOGICLOGIN logiclogin =LOGICLOGIN();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) => castamButton(
            context,
            "LOGOUT",
            () => ref.read(fireBaseLogin).logout(context),
          ),
        ),
      ),
    );
  }
}
