import 'package:playground_flutter_project/core/di/annotation/di_annotation.dart';
import 'package:playground_flutter_project/core/di/module/app_di_module.dart';
import 'package:playground_flutter_project/core/network/network_client.dart';
import 'package:playground_flutter_project/data/datasources/remote/auth_api_services.dart';

Future<void> registerApiServiceModule() async {
  di.registerLazySingleton<AuthApiServices>(
    () => AuthApiServices(
      client: di.get<NetworkClient>(
        instanceName: DIAnnotation.authBaseUrl.toString(),
      ),
    ),
  );

  return;
}
