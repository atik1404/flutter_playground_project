import 'package:go_router/go_router.dart';
import 'package:playground_flutter_project/core/router/app_routes_name.dart';
import 'package:playground_flutter_project/core/router/base_router.dart';
import 'package:playground_flutter_project/feature/auth/login/login_screen.dart';

final class LoginRouter extends BaseRouter {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
  ];
}
