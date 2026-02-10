import 'package:formz/formz.dart';

class PhoneValidator extends FormzInput<String, PhoneValidationError> {
  const PhoneValidator.pure() : super.pure('');
  const PhoneValidator.dirty([super.value = '']) : super.dirty();

  // Pattern breakdown:
  // ^(?:\+8801|01) -> Starts with +8801 or 01
  // [3-9]          -> The operator prefix (skipping 0, 1, 2 for mobile)
  // \d{8}$         -> Exactly 8 more digits
  static final _bdPhoneRegExp = RegExp(r'^(?:\+8801|01)[3-9]\d{8}$');

  @override
  PhoneValidationError? validator(String value) {
    if (value.trim().isEmpty) return PhoneValidationError.empty;

    // Remove any spaces or hyphens the user might have accidentally typed
    final cleanValue = value.replaceAll(RegExp(r'[\s-]'), '');

    return _bdPhoneRegExp.hasMatch(cleanValue)
        ? null
        : PhoneValidationError.invalid;
  }
}

enum PhoneValidationError { empty, invalid }
