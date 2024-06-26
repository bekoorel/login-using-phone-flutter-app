import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_using_phone_v2/features/login/login_logic/firebase_phone_auth.dart';

final fireBaseLogin = ChangeNotifierProvider<PhoneAuth>((ref) {
  return PhoneAuth();
});

final fireBaselogout = ChangeNotifierProvider<LOGEOUT>((ref) {
  return LOGEOUT();
});
