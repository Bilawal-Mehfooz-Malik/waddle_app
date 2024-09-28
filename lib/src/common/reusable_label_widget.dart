import 'package:flutter/material.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class ReusableLabelWidget extends StatelessWidget {
  final String text;
  const ReusableLabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.txtTheme.bodyMedium!.copyWith(
        color: context.color.onSecondary.withOpacity(0.4),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
