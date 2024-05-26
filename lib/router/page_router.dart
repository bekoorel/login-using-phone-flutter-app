import 'package:go_router/go_router.dart';
import 'package:login_using_phone/Features/Login_Using_Phone/interface/screens/enter_the_otp.dart';
import 'package:login_using_phone/Features/Login_Using_Phone/interface/screens/enter_your_phone.dart';
import 'package:login_using_phone/Features/Login_Using_Phone/interface/screens/log_out.dart';

List<RouteBase> routes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const EnterYourPhone(),
  ),
  GoRoute(
    path: '/INSERTOTP',
    builder: (context, state) => const INSERTOTP(),
  ),
    GoRoute(
    path: '/mainscreen',
    builder: (context, state) => const MIANSCREEN(),
  ),

  
];
