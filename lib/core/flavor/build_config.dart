// ignore_for_file: always_use_package_imports

import 'env_config.dart';
import 'enviroment.dart';

class BuildConfig {
  BuildConfig._internal();

  factory BuildConfig.instantiate({
    required Environment envType,
    required EnvConfig envConfig,
  }) {
    if (instance._lock) return instance;

    instance.environment = envType;
    instance.config = envConfig;
    instance._lock = true;

    return instance;
  }
  late final Environment environment;
  late final EnvConfig config;
  bool _lock = false;

  static final BuildConfig instance = BuildConfig._internal();
}
