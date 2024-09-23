import 'package:flutter/material.dart';

class SimpleErrorScreen extends StatelessWidget {
  const SimpleErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Something went wrong!')));
  }
}

class CenteredErrorWidget extends StatelessWidget {
  final String text;
  const CenteredErrorWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
