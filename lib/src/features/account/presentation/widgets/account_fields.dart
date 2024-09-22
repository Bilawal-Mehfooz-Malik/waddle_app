import 'package:flutter/material.dart';

import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/utils/validators.dart';
import 'package:waddle_app/src/common/custom_text_form_field.dart';
import 'package:waddle_app/src/utils/extensions.dart';

class AccountFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  const AccountFields({
    super.key,
    required this.nameController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          hintText: context.loc.name,
          onIconTap: () => nameController.clear(),
          validator: (val) => Validators.validateName(val, context),
          icon: nameController.text.isNotEmpty ? Icons.close : null,
        ),
        gapH20,
        CustomTextFormField(
          hintText: context.loc.email,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          onIconTap: () => emailController.clear(),
          validator: (val) => Validators.validateEmail(val, context),
          icon: emailController.text.isNotEmpty ? Icons.close : null,
        ),
      ],
    );
  }
}
