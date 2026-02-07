import 'package:playground_flutter_project/core/di/module/app_di_module.dart';
import 'package:playground_flutter_project/domain/usecase/auth/post_login_api_usecase.dart';

Future<void> registerAuthUseCaseModule() async {
  di.registerLazySingleton<PostLoginApiUsecase>(
    () => PostLoginApiUsecase(di.get()),
  );

  return;
}
