import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onPressed,
  });

  final String firstText;
  final String secondText;
  final VoidCallback onPressed;

  Text _buildText(ColorScheme theme) {
    return Text.rich(
      TextSpan(
        text: firstText,
        children: [
          TextSpan(
            text: secondText,
            style: TextStyle(color: theme.primary, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      style: TextStyle(color: theme.onSecondary),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return TextButton(onPressed: onPressed, child: _buildText(theme));
  }
}
