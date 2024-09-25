import 'package:flutter/material.dart';
import 'package:waddle_app/src/utils/extensions.dart';
import 'package:waddle_app/src/common/simple_error_screen.dart';
import 'package:waddle_app/src/common/simple_loading_screen.dart';
import 'package:waddle_app/src/features/get_started/get_started_screen.dart';
import 'package:waddle_app/src/features/account/presentation/signup_screen.dart';
import 'package:waddle_app/src/features/scaffold_with_navbar/scaffold_with_navbar.dart';

class AppRoutes {
  static const String navScaffold = '/';
  static const String signup = '/signup';
  static const String getStarted = '/getStarted';
  static const String error = '/error';
  static const String loading = '/loading';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.getStarted:
        return MaterialPageRoute(builder: (_) => const GetStartedScreen());
      case AppRoutes.navScaffold:
        return MaterialPageRoute(builder: (_) => const ScaffoldWithNavBar());
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
