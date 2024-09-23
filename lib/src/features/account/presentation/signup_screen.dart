import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/utils/extensions.dart';
import 'package:waddle_app/src/router/app_router.dart';
import 'package:waddle_app/src/common/custom_dialog.dart';
import 'package:waddle_app/src/common/custom_loading.dart';
import 'package:waddle_app/src/utils/waddle_logo_getter.dart';
import 'package:waddle_app/src/features/account/model/app_user.dart';
import 'package:waddle_app/src/features/account/data/account_repository.dart';
import 'package:waddle_app/src/features/account/presentation/widgets/headline.dart';
import 'package:waddle_app/src/features/account/presentation/widgets/account_fields.dart';
import 'package:waddle_app/src/features/account/presentation/widgets/privacy_policy_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;
  bool _isLoading = false;
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
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.p16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Spacer(),

                        // [Logo]
                        waddleLogo(220, 220),

                        // [Headline]
                        HeadlineWidget(text: context.loc.signUp),
                        gapH48,

                        // [All Text Form Fields]
                        Form(
                          key: _formKey,
                          child: AccountFields(
                            isLoading: _isLoading,
                            nameController: _nameController,
                            emailController: _emailController,
                          ),
                        ),
                        gapH32,

                        // Check Box [Accept Terms and Policy Button]
                        PrivacyPolicyButton(
                          isChecked: _isChecked,
                          onCheck: _isLoading
                              ? null
                              : (_) => setState(() {
                                    _isChecked = !_isChecked;
                                  }),
                        ),
                        gapH32,

                        // [Sign Up Button]
                        Consumer(
                          builder: (context, ref, child) {
                            return ElevatedButton(
                              onPressed: _isLoading ? null : () => _signUp(ref),
                              child: _isLoading
                                  ? CustomLoading(
                                      color: context.color.onPrimary)
                                  : Text(context.loc.signUp),
                            );
                          },
                        ),
                        const Spacer(flex: 4),
                      ],
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

  void _toggleLoading() => setState(() => _isLoading = !_isLoading);

  void _signUp(WidgetRef ref) async {
    if (!_formKey.currentState!.validate()) return;

    if (!_isChecked) {
      showErrorDialog(
        context: context,
        title: 'Accept Agreement'.hardcoded,
        content:
            'Please accept the license and agreements to continue.'.hardcoded,
      );
      return;
    }

    _toggleLoading();

    final provider = ref.read(accountRepositoryProvider);
    final result = await provider.createUser(
      AppUser(name: _nameController.text, email: _emailController.text),
    );

    _toggleLoading();

    result.fold(
      (error) => showCustomSnack(context, error),
      (_) => Navigator.pushReplacementNamed(context, AppRoutes.getStarted),
    );
  }
}
