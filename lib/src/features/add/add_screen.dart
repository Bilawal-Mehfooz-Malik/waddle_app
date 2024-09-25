import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'My Apps',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: const Center(child: Text('Add Screen')),
    );
  }
}
