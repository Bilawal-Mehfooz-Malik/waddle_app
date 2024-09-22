import 'package:flutter/material.dart';

import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/common/custom_dialog.dart';
import 'package:waddle_app/src/utils/waddle_logo_getter.dart';
import 'package:waddle_app/src/features/account/presentation/widgets/headline.dart';
import 'package:waddle_app/src/utils/extensions.dart';
import 'package:waddle_app/src/features/account/presentation/widgets/account_fields.dart';
import 'package:waddle_app/src/features/account/presentation/widgets/privacy_policy_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

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
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _updateState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Container(
                height: constraints.maxHeight,
                padding: const EdgeInsets.all(Sizes.p16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // [Logo]
                    waddleLogo(240, 240),

                    // [Headline]
                    HeadlineWidget(text: context.loc.signUp),
                    gapH48,

                    // [All Text Form Fields]
                    Form(
                      key: _formKey,
                      child: AccountFields(
                        nameController: _nameController,
                        emailController: _emailController,
                      ),
                    ),
                    gapH24,

                    // Check Box [Accept Terms and Policy Button]
                    PrivacyPolicyButton(
                      isChecked: _isChecked,
                      onCheck: (value) {
                        setState(() => _isChecked = !_isChecked);
                      },
                    ),
                    gapH24,

                    // [Sign Up Button]
                    ElevatedButton(
                      onPressed: _signUp,
                      child: Text(context.loc.create),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

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
