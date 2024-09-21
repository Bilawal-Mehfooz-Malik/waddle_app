import 'package:flutter/material.dart';
import 'package:waddle_app/src/features/auth/presentation/login/login_screen.dart';
import 'package:waddle_app/src/features/auth/presentation/signup/signup_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String signup = '/signup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
