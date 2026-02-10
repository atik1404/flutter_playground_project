import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playground_flutter_project/feature/auth/login/models/email.dart';
import 'package:playground_flutter_project/feature/auth/login/models/password.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(false) bool isValid,
    @Default(true) bool obscurePassword,
    @Default('') String apiErrorMsg,
    String? emailValidationError,
    String? passwordValidationError,
  }) = _LoginState;
}
