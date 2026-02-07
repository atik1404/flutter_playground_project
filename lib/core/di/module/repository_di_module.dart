import 'package:playground_flutter_project/core/di/module/app_di_module.dart';
import 'package:playground_flutter_project/data/repoimpl/auth_repo_impl.dart';
import 'package:playground_flutter_project/domain/repositories/auth_repository.dart';

Future<void> registerRepositoryModule() async {
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepoImpl(
      sharedPrefs: di.get(),
      authApiServices: di.get(),
      loginApiMapper: di.get(),
      profileApiMapper: di.get(),
    ),
  );

  return;
}
