sealed class SplashState {
  const SplashState();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashError extends SplashState {
  final String message;
  const SplashError(this.message);
}

sealed class SplashNavigationState extends SplashState {
  const SplashNavigationState();
}

class SplashToHomeScreen extends SplashNavigationState {
  const SplashToHomeScreen();
}

class SplashToLoginScreen extends SplashNavigationState {
  const SplashToLoginScreen();
}
