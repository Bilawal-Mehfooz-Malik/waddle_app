import 'package:flutter/material.dart';

import 'package:waddle_app/src/router.dart';
import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/utils/validators.dart';
import 'package:waddle_app/src/common/custom_dialog.dart';
import 'package:waddle_app/src/utils/waddle_logo_getter.dart';
import 'package:waddle_app/src/utils/localization_extension.dart';
import 'package:waddle_app/src/common/custom_text_form_field.dart';
import 'package:waddle_app/src/features/auth/presentation/common/headline.dart';
import 'package:waddle_app/src/features/auth/presentation/common/toggle_button.dart';
import 'package:waddle_app/src/features/auth/presentation/login/reset_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _pswController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateState);
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateState);
    _pswController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // [Contains All TextFields]
  Column _buildTextFormFields() {
    return Column(
      children: [
        CustomTextFormField(
          hintText: context.loc.email,
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onIconTap: () => _emailController.clear(),
          validator: (val) => Validators.validateEmail(val, context),
          icon: _emailController.text.isNotEmpty ? Icons.close : null,
        ),
        gapH16,
        CustomTextFormField(
          obscureText: _obscureText,
          controller: _pswController,
          hintText: context.loc.password,
          onIconTap: () => setState(() => _obscureText = !_obscureText),
          validator: (val) => Validators.validatePassword(val, context),
          icon: _obscureText ? Icons.visibility_off : Icons.visibility,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          // [Logo]
                          waddleLogo(200, 200),
                          gapH48,

                          // [Headline]
                          HeadlineWidget(text: context.loc.login),
                          gapH24,

                          // [All Text Form Fields]
                          _buildTextFormFields(),
                          gapH24,

                          // [Sign Up Button]
                          ElevatedButton(
                            onPressed: _logIn,
                            child: Text(context.loc.login),
                          ),
                          gapH8,

                          // [Forgot Password Button]
                          TextButton(
                            child: Text(context.loc.forgotPassword),
                            onPressed: () => _showResetPswrdBottomSheet(style),
                          ),
                          const Spacer(flex: 2),

                          // [Toggle Button Switch to Login]
                          CustomToggleButton(
                            onPressed: _toggle,
                            firstText: context.loc.dontHaveAccount,
                            secondText: context.loc.signUp,
                          ),
                          gapH8,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _updateState() => setState(() {});

  void _toggle() => Navigator.pushNamed(context, AppRoutes.signup);

  void _logIn() {
    if (_formKey.currentState!.validate()) {
      showErrorDialog(
        context: context,
        title: 'Login',
        content: 'Implement login logic',
      );
    }
  }

  void _showResetPswrdBottomSheet(ThemeData style) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => ResetPassword(controller: _emailController),
    );
  }
}
