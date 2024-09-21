import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.onIconTap,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
  });

  final IconData? icon;
  final bool obscureText;
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final VoidCallback onIconTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        suffixIcon: IconButton(
          onPressed: onIconTap,
          icon: Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
