import 'package:go_router/go_router.dart';
import 'package:playground_flutter_project/core/router/app_routes_name.dart';
import 'package:playground_flutter_project/core/router/base_router.dart';
import 'package:playground_flutter_project/feature/trip/home/home_screen.dart';

final class HomeRouter extends BaseRouter {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
  ];
}
