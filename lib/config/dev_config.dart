import 'default_config.dart';
class DevConfig implements DefaultConfig {
  String get apiHost => "http://10.0.2.2:8000";

  bool get reportErrors => false;

  bool get trackEvents => false;

  bool get useHttps => false;
}