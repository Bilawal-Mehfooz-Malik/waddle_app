import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:waddle_app/src/router.dart';
import 'package:waddle_app/src/utils/validators.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/common/custom_dialog.dart';
import 'package:waddle_app/src/utils/localization_extension.dart';
import 'package:waddle_app/src/common/custom_text_form_field.dart';
import 'package:waddle_app/src/features/auth/presentation/common/headline.dart';
import 'package:waddle_app/src/features/auth/presentation/common/toggle_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _pswController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cnfrmPswController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateState);
    _emailController.addListener(_updateState);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateState);
    _emailController.removeListener(_updateState);
    _pswController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _cnfrmPswController.dispose();
    super.dispose();
  }

  // [Contains All TextFields]
  Column _buildTextFormFields() {
    return Column(
      children: [
        CustomTextFormField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          hintText: context.loc.name,
          onIconTap: () => _nameController.clear(),
          validator: (val) => Validators.validateName(val, context),
          icon: _nameController.text.isNotEmpty ? Icons.close : null,
        ),
        gapH20,
        CustomTextFormField(
          hintText: context.loc.email,
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onIconTap: () => _emailController.clear(),
          validator: (val) => Validators.validateEmail(val, context),
          icon: _emailController.text.isNotEmpty ? Icons.close : null,
        ),
        gapH20,
        CustomTextFormField(
          obscureText: _obscureText,
          controller: _pswController,
          hintText: context.loc.password,
          onIconTap: () => setState(() => _obscureText = !_obscureText),
          validator: (val) => Validators.validatePassword(val, context),
          icon: _obscureText ? Icons.visibility_off : Icons.visibility,
        ),
        gapH20,
        CustomTextFormField(
          obscureText: _obscureText,
          controller: _cnfrmPswController,
          hintText: context.loc.confirmPassword,
          onIconTap: () => setState(() => _obscureText = !_obscureText),
          icon: _obscureText ? Icons.visibility_off : Icons.visibility,
          validator: (val) => Validators.validateConfirmPassword(
              val, _pswController.text, context),
        ),
      ],
    );
  }

  Row _buildTermPolicyButton(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() => _isChecked = !_isChecked);
          },
        ),
        Expanded(
          child: Text(
            context.loc.privacyPolicyText,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constrains.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.p16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),

                        // [Headline]
                        HeadlineWidget(text: context.loc.signUp),
                        gapH48,

                        // [All Text Form Fields]
                        _buildTextFormFields(),
                        gapH24,

                        // Check Box [Accept Terms and Policy Button]
                        _buildTermPolicyButton(context),
                        gapH24,

                        // [Sign Up Button]
                        ElevatedButton(
                          onPressed: _signUp,
                          child: Text(context.loc.create),
                        ),
                        const Spacer(),

                        // [Toggle Button Switch to Login]
                        CustomToggleButton(
                          onPressed: _toggle,
                          firstText: context.loc.alreadyHaveAccount,
                          secondText: context.loc.login,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _updateState() => setState(() {});

  void _toggle() => context.goNamed(AppRoutes.login.name);

  void _signUp() {
    if (_formKey.currentState!.validate() && _isChecked) {
      showErrorDialog(
          context: context, title: 'Signup', content: 'Implement signup logic');
      return;
    } else if (!_formKey.currentState!.validate()) {
      return;
    } else if (!_isChecked) {
      showErrorDialog(
        context: context,
        title: 'Accept Agreement',
        content: 'Please accept liscence and agreements in order to continue',
      );
    }
  }
}
