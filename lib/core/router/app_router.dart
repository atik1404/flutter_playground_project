import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter_project/core/router/app_routes_name.dart';
import 'package:playground_flutter_project/core/router/base_router.dart';
import 'package:playground_flutter_project/feature/auth/login/login_router.dart';
import 'package:playground_flutter_project/feature/auth/splash/splash_router.dart';
import 'package:playground_flutter_project/feature/trip/home/home_router.dart';
import 'package:playground_flutter_project/feature/trip/trip_booking_screen_router.dart';

List<BaseRouter> get routers => [
  SplashRouter(),
  LoginRouter(),
  HomeRouter(),
  TripBookingScreenRouter(),
];

final GoRouter router = goRouter();
final routeObserver = RouteObserver<ModalRoute<void>>();

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();

GoRouter goRouter() {
  return GoRouter(
    initialLocation: AppRoutesName.splashScreen,
    navigatorKey: rootNavKey,
    routes: [...routers.expand((r) => r.routes)],
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.error?.message ?? "Unknown screen"),
              TextButton(
                onPressed: () => context.pop(),
                child: const Text("Back"),
              ),
            ],
          ),
        ),
      );
    },
  );
}
