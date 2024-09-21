import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:waddle_app/src/utils/localization_extension.dart';

class Validators {
  static String? validateName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.loc.emptyName;
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.loc.emptyEmail;
    }
    if (!EmailValidator.validate(value)) {
      return context.loc.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.loc.emptyPassword;
    }
    if (value.length < 6) {
      return context.loc.shortPassword;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String password,
    BuildContext context,
  ) {
    if (value == null || value.isEmpty) {
      return context.loc.emptyConfirmPassword;
    }
    if (value != password) {
      return context.loc.passwordsDoNotMatch;
    }
    return null;
  }
}
