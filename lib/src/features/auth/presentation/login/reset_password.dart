import 'package:flutter/material.dart';
import 'package:waddle_app/src/utils/validators.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/common/custom_text_form_field.dart';
import 'package:waddle_app/src/utils/localization_extension.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _isEmailSent = false;
  final _formKey = GlobalKey<FormState>();

  void _sendEmail() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isEmailSent = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(Sizes.p20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          gapH8,
          if (!_isEmailSent) ...[
            // [Headline]
            Text(
              context.loc.forgotYourPassword,
              style: style.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            gapH16,

            // [Body Text]
            Text(context.loc.forgotPasswordBody),
            gapH8,

            // [Email Text Field]
            Form(
              key: _formKey,
              child: CustomTextFormField(
                hintText: context.loc.email,
                controller: widget.controller,
                keyboardType: TextInputType.emailAddress,
                onIconTap: () => widget.controller.clear(),
                validator: (val) => Validators.validateEmail(val, context),
                icon: widget.controller.text.isNotEmpty ? Icons.close : null,
              ),
            ),
            gapH24,

            // [Reset Password Button]
            ElevatedButton(
              onPressed: _sendEmail,
              child: Text(context.loc.resetPassword),
            ),
          ] else ...[
            // Icon
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: style.colorScheme.primary,
              ),
              child: Icon(
                size: 60,
                Icons.mark_email_read_rounded,
                color: style.colorScheme.onPrimary,
              ),
            ),
            gapH20,

            // [Body Text]
            Text(context.loc.emailSent, style: style.textTheme.titleMedium),
            gapH8,
          ],
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
