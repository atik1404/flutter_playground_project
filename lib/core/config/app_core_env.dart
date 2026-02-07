

import 'package:playground_flutter_project/core/config/env/app_dev_env.dart';
import 'package:playground_flutter_project/core/config/env/app_env_fields.dart';
import 'package:playground_flutter_project/core/config/env/app_live_env.dart';
import 'package:playground_flutter_project/core/config/flavor_config.dart';

abstract interface class AppCoreEnv implements AppEnvFields {
  factory AppCoreEnv() => _instance;
  static final AppCoreEnv _instance = _getEnv();

  static AppCoreEnv _getEnv() {
    switch (FlavorConfig().appFlavor) {
      case Flavor.development:
        return AppDevEnv();
      case Flavor.production:
        return AppLiveEnv();
    }
  }
}
