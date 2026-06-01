import '../l10n/app_strings.dart';

class Validators {
  Validators._();

  static String? validateEmail(String? value, AppStrings t) {
    if (value == null || value.isEmpty) return t.emailRequired;
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value)) return t.emailInvalid;
    return null;
  }

  static String? validatePassword(String? value, AppStrings t) {
    if (value == null || value.isEmpty) return t.passwordRequired;
    if (value.length < 8) return t.passwordTooShort;
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return t.passwordNeedsUppercase;
    }
    if (!value.contains(RegExp(r'\d'))) {
      return t.passwordNeedsDigit;
    }
    return null;
  }

  static String? validateRequired(String? value, String fieldName, AppStrings t) {
    if (value == null || value.trim().isEmpty) return t.fieldRequired(fieldName);
    return null;
  }

  static String? validatePhone(String? value, AppStrings t) {
    if (value == null || value.isEmpty) return t.phoneRequired;
    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    if (!phoneRegex.hasMatch(value)) {
      return t.phoneInvalid;
    }
    return null;
  }
}
