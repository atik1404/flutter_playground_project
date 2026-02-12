import 'package:playground_flutter_project/core/di/module/app_di_module.dart';
import 'package:playground_flutter_project/data/repoimpl/auth_repo_impl.dart';
import 'package:playground_flutter_project/data/repoimpl/trip_repo_impl.dart';
import 'package:playground_flutter_project/domain/repositories/auth_repository.dart';
import 'package:playground_flutter_project/domain/repositories/trips_repository.dart';

Future<void> registerRepositoryModule() async {
  di
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepoImpl(
        authApiServices: di.get(),
        loginApiMapper: di.get(),
        profileApiMapper: di.get(),
      ),
    )
    ..registerLazySingleton<TripsRepository>(
      () => TripRepoImpl(tripApiServices: di.get(), tripsApiMapper: di.get()),
    );

  return;
}
