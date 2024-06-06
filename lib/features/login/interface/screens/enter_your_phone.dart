import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_using_phone_v2/core/colors/colors.dart';
import 'package:login_using_phone_v2/core/sherd_widget/custam_sherd_widget.dart';
import 'package:login_using_phone_v2/features/login/login_logic/providers.dart';

// ignore: must_be_immutable
class EnterYourPhone extends StatelessWidget {
  EnterYourPhone({super.key});

  final TextEditingController _phoneController = TextEditingController();
//LOGICLOGIN logiclogin =LOGICLOGIN();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 1,
          ),
          Text(
            'Enter your Phone Number',
            style: TextStyle(color: COLORS.black, fontSize: 30),
          ),
          const Spacer(
            flex: 2,
          ),
          custamTextFild(context, _phoneController),
          const Spacer(
            flex: 1,
          ),
          //SUPMENT_NUMBER
          Consumer(
            builder: (context, ref, child) => castamButton(
              context,
              "NEXT",
              () => ref
                  .read(fireBaseLogin)
                  .sendCode(context, _phoneController.text),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
