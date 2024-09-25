import 'package:flutter/material.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        context.loc.myApps,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )),
      body: const Center(child: Text('Add Screen')),
    );
  }
}
