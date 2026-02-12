import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playground_flutter_project/feature/auth/login/models/phone_validator.dart';
import 'package:playground_flutter_project/feature/auth/login/models/password_validator.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(PhoneValidator.pure()) PhoneValidator phone,
    @Default(PasswordValidator.pure()) PasswordValidator password,
    @Default(false) bool isValid,
    @Default(false) bool isProfileApiSuccess,
    @Default(false) bool isProfileApiFailed,
    @Default(true) bool obscurePassword,
    @Default('') String toastMessage,
    @Default('') String errorMessage,
    @Default('') emailValidationError,
    @Default('') passwordValidationError,
  }) = _LoginState;
}
