import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waddle_app/src/features/account/data/account_repository.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameValue = ref.watch(userNameProvider);

    return Scaffold(
      appBar: _buildAppBar(userNameValue),
      body: const Center(child: Text('Home Screen')),
    );
  }

  AppBar _buildAppBar(AsyncValue<String> userNameValue) {
    return AppBar(
      title: userNameValue.when(
        data: (name) => Text(
          'Hi, $name!',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        error: (error, _) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
