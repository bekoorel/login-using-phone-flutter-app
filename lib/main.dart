import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_using_phone_v2/core/colors/colors.dart';
import 'package:login_using_phone_v2/features/login/login_logic/firebase_phone_auth.dart';
import 'package:login_using_phone_v2/firebase_options.dart';
import 'package:login_using_phone_v2/core/router/page_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: SafeArea(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isloggedIn = AuthService().isUserLoggedIn();
    final GoRouter router = GoRouter(
        initialLocation: isloggedIn ? '/mainscreen' : '/', routes: routes);

    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: COLORS.white),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
