import 'package:cricketmania/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void MovetoHome(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      await Navigator.pushReplacementNamed(context, RoutesName.home);
    });
  }
}
