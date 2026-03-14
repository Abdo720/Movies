import 'package:flutter/material.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class ConstFunctions {
  static String? validateName(String name) {
    if (name.trim().isEmpty) return "name_required".tr();
    if (name.trim().length < 3) return "name_min".tr();
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(name)) {
      return "name_letters".tr();
    }
    return null;
  }

  static String? validateEmail(String email) {
    if (email.trim().isEmpty) return "email_required".tr();
    if (email.contains(' ')) return "email_spaces".tr();
    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!regex.hasMatch(email)) return "email_invalid".tr();
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) return "password_required".tr();
    if (password.length < 6) return "password_length".tr();
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return "password_upper".tr();
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return "password_lower".tr();
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return "password_number".tr();
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(password)) {
      return "password_special".tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String password, String confirm) {
    if (confirm.isEmpty) return "confirm_required".tr();
    if (password != confirm) return "passwords_not_match".tr();
    return null;
  }

  static String? validatePhone(String phone) {
    final regex = RegExp(r'^\+?[0-9]{10,15}$');
    if (phone.isEmpty) return "phone_required".tr();
    if (!regex.hasMatch(phone)) return "phone_invalid".tr();
    return null;
  }
}
