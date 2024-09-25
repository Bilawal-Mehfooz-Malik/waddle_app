import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waddle_app/src/theme/theme_controller.dart';
import 'package:waddle_app/src/features/home/presentation/name_controller.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(ref, context),
      body: const Center(child: Text('Home Screen')),
    );
  }

  AppBar _buildAppBar(WidgetRef ref, BuildContext context) {
    final userNameValue = ref.watch(nameProvider);
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final hi = context.loc.hi;

    return AppBar(
      title: userNameValue.when(
        data: (name) => Text(
          '$hi$name!',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        error: (error, _) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
      actions: [
        IconButton(
          icon: _getThemeIcon(themeMode),
          onPressed: () => _onPressed(themeNotifier, themeMode),
        ),
      ],
    );
  }

  void _onPressed(ThemeController notifier, ThemeMode themeMode) {
    notifier.updateThemeMode(
        themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }

  Icon _getThemeIcon(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return const Icon(Icons.light_mode_outlined);
      case ThemeMode.light:
        return const Icon(Icons.dark_mode_outlined);
      case ThemeMode.system:
      default:
        return const Icon(Icons.brightness_auto_outlined);
    }
  }
}
