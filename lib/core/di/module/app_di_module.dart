import 'package:get_it/get_it.dart';
import 'package:playground_flutter_project/core/config/app_core_env.dart';
import 'package:playground_flutter_project/core/di/annotation/di_annotation.dart';
import 'package:playground_flutter_project/core/di/module/api_service_di_module.dart';
import 'package:playground_flutter_project/core/di/module/mapper_di_module.dart';
import 'package:playground_flutter_project/core/di/module/repository_di_module.dart';
import 'package:playground_flutter_project/core/di/module/usecase_di_module.dart';
import 'package:playground_flutter_project/core/network/network_client.dart';
import 'package:playground_flutter_project/core/sharedpref/shared_prefs.dart';

final di = GetIt.instance;

Future<void> initDi() async {
  final sharedPrefs = SharedPrefs();
  await sharedPrefs.init();

  di
    ..registerSingleton<SharedPrefs>(SharedPrefs())
    ..registerLazySingleton<NetworkClient>(
      () => NetworkClient(
        baseUrl: AppCoreEnv().appBaseUrl,
        sharedPrefs: di.get(),
      ),
      instanceName: DIAnnotation.baseURL.toString(),
    )
    ..registerLazySingleton<NetworkClient>(
      () => NetworkClient(
        baseUrl: AppCoreEnv().authBaseUrl,
        sharedPrefs: di.get(),
      ),
      instanceName: DIAnnotation.authBaseUrl.toString(),
    );

  await registerAuthUseCaseModule();

  await registerRepositoryModule();

  await registerApiServiceModule();

  await registerAuthMapperModule();
}
