import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter_project/core/di/module/app_di_module.dart';
import 'package:playground_flutter_project/core/router/app_routes_name.dart';
import 'package:playground_flutter_project/core/router/base_router.dart';
import 'package:playground_flutter_project/domain/usecase/trip/fetch_trips_api_usecase.dart';
import 'package:playground_flutter_project/feature/trip/home/bloc/home_bloc.dart';
import 'package:playground_flutter_project/feature/trip/home/home_screen.dart';

final class HomeRouter extends BaseRouter {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.homeScreen,
      builder: (context, state) {
        return BlocProvider(
          create: (_) =>
              HomeBloc(fetchTripsApiUsecase: di.get<FetchTripsApiUsecase>()),
          child: const HomeScreen(),
        );
      },
    ),
  ];
}
