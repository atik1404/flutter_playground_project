import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_pref_key.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_prefs.dart';
import 'package:playground_flutter_project/domain/usecase/auth/fetch_profile_api_usecase.dart';
import 'package:playground_flutter_project/feature/auth/splash/state/splash_state.dart';

/// Cubit for handling splash screen logic such as:
/// - Determining whether to show onboarding
/// - Verifying user authentication
/// - Fetching the user profile if necessary
class SplashCubit extends Cubit<SplashState> {
  final FetchProfileApiUseCase _fetchUserProfileApiUseCase;
  final SharedPrefs _prefs;

  SplashCubit({
    required FetchProfileApiUseCase useCase,
    required SharedPrefs prefs,
  }) : _fetchUserProfileApiUseCase = useCase,
       _prefs = prefs,
       super(const SplashLoading()) {
    _checkUserIsAuthorized();
  }

  /// Checks if the user is authorized and proceeds accordingly.
  void _checkUserIsAuthorized() {
    final isAuthenticated = _prefs.getBool(
      key: SharedPrefKey.userLoggedInStatus,
    );

    if (isAuthenticated) {
      fetchUserProfile();
    } else {
      _clearCacheAndNavigateToLogin();
    }
  }

  /// Clears user session and navigates to login screen.
  void _clearCacheAndNavigateToLogin() async {
    await _prefs.clearAll();
    emit(const SplashToLoginScreen());
  }

  /// Fetches the user profile if user is authenticated.
  void fetchUserProfile() async {
    if (state is! SplashLoading) emit(const SplashLoading());

    final response = await _fetchUserProfileApiUseCase.invoke();
    response.when(
      success: (data) => emit(const SplashToHomeScreen()),
      failure: (error) {
        final statusCode = error.statusCode;
        if (statusCode == 401 || statusCode == 403) {
          _clearCacheAndNavigateToLogin();
        } else {
          emit(SplashError(error.message));
        }
      },
    );
  }
}
