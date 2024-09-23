import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// extension to reduce boilerplate code for using localized text
extension LocalizationExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}

// extension for easy access to themdata
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

// extension for easy access to texttheme
extension TextThemeExtension on BuildContext {
  TextTheme get txtTheme => Theme.of(this).textTheme;
}

// extension for easy access to colorscheme
extension ColorSchemeExtension on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
}

// A simple placeholder that can be used to search all the hardcoded strings
// in the code (useful to identify strings that need to be localized).
extension StringHardcoded on String {
  String get hardcoded => this;
}
