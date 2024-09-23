import 'package:flutter/material.dart';

class SimpleLoadingScreen extends StatelessWidget {
  const SimpleLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
