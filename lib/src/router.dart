import 'package:go_router/go_router.dart';
import 'package:waddle_app/src/features/auth/login/presentation/login_screen.dart';
import 'package:waddle_app/src/features/auth/signup/presentation/signup_screen.dart';

enum AppRoutes { login, signup }

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: AppRoutes.signup.name,
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);
