import 'package:go_router/go_router.dart';
import 'package:playground_flutter_project/core/router/app_routes_name.dart';
import 'package:playground_flutter_project/core/router/base_router.dart';
import 'package:playground_flutter_project/feature/auth/splash/splash_screen.dart';

final class SplashRouter extends BaseRouter {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
  ];
}
