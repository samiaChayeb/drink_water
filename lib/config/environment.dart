import 'default_config.dart';
import 'dev_config.dart';
import 'prod_config.dart';

class Environment {
  static const String DEV = 'DEV';
  static const String PROD = 'PROD';
  DefaultConfig config = DevConfig();

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  DefaultConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.PROD:
        return ProdConfig();
      default:
        return DevConfig();
    }
  }
}
