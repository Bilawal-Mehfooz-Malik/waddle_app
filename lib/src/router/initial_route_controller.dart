import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waddle_app/src/features/account/data/account_repository.dart';

final initialRouteProvider = Provider<String>((ref) {
  final userExists = ref.watch(userStatusProvider);
  final initialRoute = userExists.when(
    loading: () => '/loading',
    error: (error, stackTrace) => '/error',
    data: (userExists) => userExists ? '/' : '/signup',
  );
  return initialRoute;
});
