import 'package:cricketmania/view/Login.dart';
import 'package:cricketmania/view/forgot_password.dart';
import 'package:cricketmania/view/score.dart';
import 'package:cricketmania/view/seeall.dart';
import 'package:cricketmania/view/signup.dart';
import 'package:cricketmania/view/splash_screen.dart';
import 'package:cricketmania/view_model/home_services/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:cricketmania/utils/routes/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const CustomNavBar());
      case RoutesName.scoreScreen:
        return MaterialPageRoute(builder: (context) => const ScoreScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      case RoutesName.forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());

      case RoutesName.seeAllScreen:
        return MaterialPageRoute(builder: (context) => const SeeAllPage());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text(
                      "No Route Found",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headlineLarge!.fontSize,
                      ),
                    ),
                  ),
                ));
    }
  }
}
