import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:waddle_app/src/utils/extensions.dart';

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
}
