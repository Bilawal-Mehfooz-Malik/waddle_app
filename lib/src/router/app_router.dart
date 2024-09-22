import 'package:flutter/material.dart';
import 'package:waddle_app/src/features/home/home_screen.dart';
import 'package:waddle_app/src/features/account/presentation/signup_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String signup = '/signup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
