import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LOGICLOGIN {
  static submentPhone(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go('/INSERTOTP');
    });
  }

  static submentotp(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go('/mainscreen');
    });
  }
    static logout(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go('/');
    });
  }
}
