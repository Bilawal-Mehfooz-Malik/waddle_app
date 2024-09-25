import 'package:flutter/material.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class PrivacyPolicyButton extends StatelessWidget {
  const PrivacyPolicyButton({
    super.key,
    required this.isChecked,
    required this.onCheck,
  });

  final bool isChecked;
  final void Function(bool? value)? onCheck;

  @override
  Widget build(BuildContext context) {
    final color = context.color.onSurface.withOpacity(0.7);
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onCheck,
          side: BorderSide(color: color, width: 2),
        ),
        Expanded(
          child: Text(
            context.loc.privacyPolicyText,
            style: TextStyle(color: color),
          ),
        ),
      ],
    );
  }
}
