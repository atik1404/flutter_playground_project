import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:playground_flutter_project/common/extensions/string_extension.dart';
import 'package:playground_flutter_project/common/logger/app_logger.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_pref_key.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_prefs.dart';
import 'package:playground_flutter_project/designsystem/resources/app_strings.dart';
import 'package:playground_flutter_project/domain/entities/params/auth/login_params.dart';
import 'package:playground_flutter_project/domain/usecase/auth/fetch_profile_api_usecase.dart';
import 'package:playground_flutter_project/domain/usecase/auth/post_login_api_usecase.dart';
import 'package:playground_flutter_project/feature/auth/login/bloc/login_event.dart';
import 'package:playground_flutter_project/feature/auth/login/bloc/login_state.dart';
import 'package:playground_flutter_project/feature/auth/login/models/phone_validator.dart';
import 'package:playground_flutter_project/feature/auth/login/models/password_validator.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLoginApiUsecase _postLoginApiUsecase;
  final FetchProfileApiUseCase _fetchProfileApiUseCase;
  final SharedPrefs _sharedPrefs = GetIt.I.get<SharedPrefs>();

  LoginBloc({
    required PostLoginApiUsecase postLoginApiUsecase,
    required FetchProfileApiUseCase fetchProfileApiUseCase,
  }) : _postLoginApiUsecase = postLoginApiUsecase,
       _fetchProfileApiUseCase = fetchProfileApiUseCase,
       super(const LoginState()) {
    on<PhoneChanged>(_onPhoneChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<Submitted>(_onSubmitted);
    on<ObscurePasswordToggled>(_onObscurePasswordToggled);
    on<FetchProfile>(_onFetchProfile);
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<LoginState> emit) {
    final phone = PhoneValidator.dirty(event.phone);
    emit(
      state.copyWith(
        phone: phone,
        isValid: Formz.validate([phone, state.password]),
        emailValidationError: '',
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = PasswordValidator.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.phone, password]),
        passwordValidationError: '',
      ),
    );
  }

  Future<void> _onSubmitted(Submitted event, Emitter<LoginState> emit) async {
    if (state.phone.isNotValid) {
      emit(state.copyWith(emailValidationError: AppStrings.hintPhoneNumber));

      return;
    }

    if (state.password.isNotValid) {
      emit(
        state.copyWith(
          passwordValidationError: AppStrings.errorInvalidPassword,
        ),
      );

      return;
    }

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        toastMessage: '',
        emailValidationError: '',
        passwordValidationError: '',
      ),
    );

    final result = await _postLoginApiUsecase.invoke(
      LoginParams(phone: state.phone.value.formatPhoneNumber(), password: state.password.value),
    );

    result.when(
      success: (data) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        add(const FetchProfile());
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            toastMessage: error.message,
          ),
        );
      },
    );
  }

  void _onObscurePasswordToggled(
    ObscurePasswordToggled event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  Future<void> _onFetchProfile(
    FetchProfile event,
    Emitter<LoginState> emit,
  ) async {
    AppLogger.log(
      "Token: ${_sharedPrefs.getString(key: SharedPrefKey.accessToken)}",
    );
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        isProfileApiSuccess: false,
        isProfileApiFailed: false,
      ),
    );

    final result = await _fetchProfileApiUseCase.invoke();

    result.when(
      success: (data) {
        emit(
          state.copyWith(isProfileApiSuccess: true, isProfileApiFailed: false),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(isProfileApiSuccess: false, isProfileApiFailed: true),
        );
      },
    );
  }
}
