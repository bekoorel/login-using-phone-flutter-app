import 'package:flutter/material.dart';
import 'package:login_using_phone/colors/colors.dart';

import '../../logic/all_logic.dart';
import '../widget/all_widget.dart';

class EnterYourPhone extends StatelessWidget {
  const EnterYourPhone({super.key});

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
          insertNaumber(context),
         const Spacer(flex: 1,),
          nextButton(context,"NEXT", () => LOGICLOGIN.submentPhone(context)),
         const Spacer(flex: 2,),
         
        ],
      ),
    );
  }
}
