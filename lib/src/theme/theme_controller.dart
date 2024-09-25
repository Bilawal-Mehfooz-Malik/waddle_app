import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_service.dart';

class ThemeController extends Notifier<ThemeMode> {
  late ThemeService _settingsService;

  @override
  ThemeMode build() {
    _settingsService = ref.watch(themeServiceProvider);
    loadSettings();
    return ThemeMode.system;
  }

  Future<void> loadSettings() async {
    final themeMode = await _settingsService.themeMode();
    state = themeMode;
  }

  Future<void> updateThemeMode(ThemeMode newMode) async {
    if (newMode == state) return;

    state = newMode;
    await _settingsService.updateThemeMode(newMode);
  }

  ThemeMode get currentThemeMode => state;
}

final themeModeProvider =
    NotifierProvider<ThemeController, ThemeMode>(ThemeController.new);
