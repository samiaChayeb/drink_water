import 'default_config.dart';
class ProdConfig implements DefaultConfig {
  String get apiHost => "example.com";

  bool get reportErrors => true;

  bool get trackEvents => true;

  bool get useHttps => true;
}