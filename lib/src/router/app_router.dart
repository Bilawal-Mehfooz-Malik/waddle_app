import 'package:flutter/material.dart';
import 'package:waddle_app/src/common/simple_error_screen.dart';
import 'package:waddle_app/src/common/simple_loading_screen.dart';
import 'package:waddle_app/src/features/home/home_screen.dart';
import 'package:waddle_app/src/features/account/presentation/signup_screen.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class AppRoutes {
  static const String home = '/';
  static const String signup = '/signup';
  static const String error = '/error';
  static const String loading = '/loading';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.loading:
        return MaterialPageRoute(builder: (_) => const SimpleLoadingScreen());
      case AppRoutes.error:
        return MaterialPageRoute(builder: (_) => const SimpleErrorScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'.hardcoded),
            ),
          ),
        );
    }
  }
}
