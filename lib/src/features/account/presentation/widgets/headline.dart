import 'package:flutter/material.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    // [Returning widget]
    return _buildHeadline(context);
  }

  Align _buildHeadline(BuildContext context) {
    final txtStyle =
        context.txtTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold);

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: txtStyle),
    );
  }
}
