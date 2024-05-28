import 'package:flutter/material.dart';
import 'package:login_using_phone_v2/colors/colors.dart';

import '../../logic/all_logic.dart';
import '../widget/all_widget.dart';

// ignore: must_be_immutable
class EnterYourPhone extends StatelessWidget {
   EnterYourPhone({super.key});

  final TextEditingController _phoneController = TextEditingController();
LOGICLOGIN logiclogin =LOGICLOGIN();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
          insertNaumber(context,_phoneController),
         const Spacer(flex: 1,),
          nextButton(context,"NEXT", () => logiclogin.submentPhone(context,_phoneController.text)),
         const Spacer(flex: 2,),
         
        ],
      ),
    );
  }
}
