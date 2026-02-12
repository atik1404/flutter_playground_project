import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter_project/core/router/app_routes_name.dart';
import 'package:playground_flutter_project/feature/auth/splash/state/splash_cubit.dart';
import 'package:playground_flutter_project/feature/auth/splash/state/splash_state.dart';
import 'package:playground_flutter_project/ui/common/error_ui.dart';
import 'package:playground_flutter_project/ui/common/full_screen_loader.dart';

// SplashScreen widget displays splash UI and handles navigation based on SplashCubit states
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// Handles navigation side effects when SplashCubit emits a navigation state.
  /// Uses go_router for navigation. Called from BlocConsumer's listener.
  void _handleSplashNavigation(BuildContext context, SplashState state) {
    if (state is SplashToLoginScreen) {
      context.go(AppRoutesName.loginScreen);
    } else if (state is SplashToHomeScreen) {
      context.go(AppRoutesName.homeScreen);
    }
  }

  /// Builds the error UI when the SplashState is SplashError.
  /// Shows an error message and a retry button.
  Widget _buildSplashErrorWidget({
    required VoidCallback onRetry,
    required String message,
  }) {
    return ErrorUi(errorMessage: message, onRetry: onRetry);
  }

  // @override
  // void initState() {
  //   super.initState();

  //   // After the first frame, trigger onboarding/profile check.
  //   // (Using addPersistentFrameCallback, but usually addPostFrameCallback is preferred for a single fire)
  //   WidgetsBinding.instance.addPostFrameCallback((duration) {
  //     context.read<SplashCubit>().checkOnboardingScreenIsLoaded();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        // Only listen for navigation state changes (side effects, not UI)
        listenWhen: (prev, current) => current is SplashNavigationState,
        // Only rebuild UI for non-navigation states (i.e., UI state changes)
        buildWhen: (prev, current) => current is! SplashNavigationState,
        listener: _handleSplashNavigation,
        builder: (_, state) {
          // If there's an error, show the error UI with retry
          if (state is SplashError) {
            return _buildSplashErrorWidget(
              onRetry: () => context.read<SplashCubit>().fetchUserProfile(),
              message: state.message,
            );
          }

          // Default: show splash image
          return const FullScreenLoader();
        },
      ),
    );
  }
}
