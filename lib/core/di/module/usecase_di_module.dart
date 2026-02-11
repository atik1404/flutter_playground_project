import 'package:playground_flutter_project/core/di/module/app_di_module.dart';
import 'package:playground_flutter_project/domain/usecase/auth/fetch_profile_api_usecase.dart';
import 'package:playground_flutter_project/domain/usecase/auth/post_login_api_usecase.dart';
import 'package:playground_flutter_project/domain/usecase/trip/fetch_trips_api_usecase.dart';

Future<void> registerAuthUseCaseModule() async {
  di
    ..registerLazySingleton<PostLoginApiUsecase>(
      () => PostLoginApiUsecase(di.get()),
    )
    ..registerLazySingleton<FetchProfileApiUseCase>(
      () => FetchProfileApiUseCase(di.get()),
    );

  return;
}

Future<void> registerTripUseCaseModule() async {
  di.registerLazySingleton<FetchTripsApiUsecase>(
    () => FetchTripsApiUsecase(di.get()),
  );

  return;
}
