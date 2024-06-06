import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_using_phone_v2/features/login/login_logic/all_logic.dart';

final countdownProvider = ChangeNotifierProvider<COUNTEROTP>((ref) {
  return COUNTEROTP();
});

final fireBaseLogin = Provider<LOGICLOGIN>((ref) {
  return LOGICLOGIN();
});