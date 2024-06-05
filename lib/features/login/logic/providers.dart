import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_using_phone_v2/Features/login/logic/all_logic.dart';

final countdownProvider = NotifierProvider<COUNTEROTP, dynamic>(() {
  return COUNTEROTP();
});
