import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter_project/core/di/module/app_di_module.dart';
import 'package:playground_flutter_project/core/router/app_routes_name.dart';
import 'package:playground_flutter_project/core/router/base_router.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_prefs.dart';
import 'package:playground_flutter_project/domain/usecase/auth/fetch_profile_api_usecase.dart';
import 'package:playground_flutter_project/feature/auth/splash/splash_screen.dart';
import 'package:playground_flutter_project/feature/auth/splash/state/splash_cubit.dart';

final class SplashRouter extends BaseRouter {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.splashScreen,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => SplashCubit(
            useCase: di.get<FetchProfileApiUseCase>(),
            prefs: di.get<SharedPrefs>(),
          ),
          child: const SplashScreen(),
        );
      },
    ),
  ];
}
