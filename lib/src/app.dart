import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'settings/settings_controller.dart';
import 'package:waddle_app/src/router/app_router.dart';
import 'package:waddle_app/src/theme/light_theme.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
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
          theme: lightTheme,
          darkTheme: lightTheme,
          themeMode: settingsController.themeMode,
          initialRoute: AppRoutes.signup,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
