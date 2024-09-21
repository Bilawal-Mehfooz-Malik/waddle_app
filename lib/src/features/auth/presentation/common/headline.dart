import 'package:flutter/material.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);

    // [Returning widget]
    return _buildHeadline(context, style);
  }

  Align _buildHeadline(BuildContext context, ThemeData style) {
    final txtStyle =
        style.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold);

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: txtStyle),
    );
  }
}
