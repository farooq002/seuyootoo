import 'package:dio/dio.dart';
import 'package:souyoutoo/utils/local_storage/storage_service.dart';
import 'environment_config.dart';

enum Environment { live, stage, dev, qa }

class GlobalConfig {
  static EnvironmentConfig? _currentEnvironment;
  GlobalConfig();

  static void setEnvironment(Environment environment) {
    var baseUrl = '';

    switch (environment) {
      case Environment.stage:
        baseUrl = 'https://sueyoutoo.com';
        break;
      case Environment.live:
        baseUrl = 'https://sueyoutoo.com';
        break;
      case Environment.dev:
        baseUrl = 'https://sueyoutoo.com';
        break;
      case Environment.qa:
        baseUrl = 'https://sueyoutoo.com';
        break;
      default:
        baseUrl = 'https://sueyoutoo.com';
        break;
    }

    _currentEnvironment = EnvironmentConfig(
      baseUrl: baseUrl,
      dioClient: Dio(), // ✅ ensures dioClient is initialized
      httpHeaders: {},
      authorizationToken: StorageService.instance.getToken(),
    );
  }

  static EnvironmentConfig? getCurrentEnvironment() => _currentEnvironment;
}
