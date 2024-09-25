import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:waddle_app/src/utils/extensions.dart';
import 'package:waddle_app/src/theme/light_theme.dart';
import 'package:waddle_app/src/router/app_router.dart';
import 'package:waddle_app/src/theme/theme_controller.dart';
import 'package:waddle_app/src/router/initial_route_controller.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialRoute = ref.watch(initialRouteProvider);
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      onGenerateTitle: (BuildContext context) => context.loc.appTitle,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: ThemeData.dark(),
      initialRoute: initialRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
