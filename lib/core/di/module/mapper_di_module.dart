import 'package:playground_flutter_project/core/di/module/app_di_module.dart';
import 'package:playground_flutter_project/data/mappers/auth/login_api_mapper.dart';

Future<void> registerAuthMapperModule() async {
  di.registerFactory(LoginApiMapper.new);

  return;
}
