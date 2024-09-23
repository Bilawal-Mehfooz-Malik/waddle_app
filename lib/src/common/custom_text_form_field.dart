import 'package:flutter/material.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.icon,
    this.onIconTap,
    this.keyboardType,
    this.readOnly = false,
  });

  final IconData? icon;
  final bool readOnly;
  final String hintText;
  final VoidCallback? onIconTap;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        suffixIcon: IconButton(
          onPressed: onIconTap,
          icon: Icon(
            icon,
            size: 20,
            color: context.color.onSecondary.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
