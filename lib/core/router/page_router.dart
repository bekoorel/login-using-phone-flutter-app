import 'package:go_router/go_router.dart';
import 'package:login_using_phone_v2/Features/login/interface/screens/enter_the_otp.dart';
import 'package:login_using_phone_v2/Features/login/interface/screens/enter_your_phone.dart';
import 'package:login_using_phone_v2/Features/login/interface/screens/log_out.dart';

List<RouteBase> routes = [
  GoRoute(
    path: '/',
    builder: (context, state) => EnterYourPhone(),
  ),
  GoRoute(
    path: '/INSERTOTP',
    builder: (context, state) => INSERTOTP(),
  ),
  GoRoute(
    path: '/mainscreen',
    builder: (context, state) => MIANSCREEN(),
  ),
];
