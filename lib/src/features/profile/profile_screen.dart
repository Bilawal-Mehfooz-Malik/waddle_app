import 'package:flutter/material.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Center(child: Text('Profile Screen')),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        context.loc.profile,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
