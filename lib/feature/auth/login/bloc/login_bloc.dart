import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:playground_flutter_project/designsystem/resources/app_strings.dart';
import 'package:playground_flutter_project/feature/auth/data/repository/auth_repository.dart';
import 'package:playground_flutter_project/feature/auth/login/bloc/login_event.dart';
import 'package:playground_flutter_project/feature/auth/login/bloc/login_state.dart';
import 'package:playground_flutter_project/feature/auth/login/models/email.dart';
import 'package:playground_flutter_project/feature/auth/login/models/password.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<Submitted>(_onSubmitted);
    on<ObscurePasswordToggled>(_onObscurePasswordToggled);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
        emailValidationError: null,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
        passwordValidationError: null,
      ),
    );
  }

  Future<void> _onSubmitted(Submitted event, Emitter<LoginState> emit) async {
    if (state.email.isNotValid) {
      emit(state.copyWith(emailValidationError: AppStrings.errorInvalidEmail));

      return;
    }

    if (state.password.isNotValid) {
      emit(state.copyWith(passwordValidationError: AppStrings.errorInvalidPassword));

      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authRepository.login(
        email: state.email.value,
        password: state.password.value,
      );

      emit(state.copyWith(status: FormzSubmissionStatus.success));

    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          apiErrorMsg: e.toString(),
        ),
      );
    }
  }

  void _onObscurePasswordToggled(
    ObscurePasswordToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }
}
