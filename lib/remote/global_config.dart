// ignore_for_file: unreachable_switch_default

import 'package:dio/dio.dart';

import 'environment_config.dart';
enum Environment { live, stage, dev, qa }
class GlobalConfig {
  static EnvironmentConfig? _currentEnvironment;
  GlobalConfig();

  static void setEnvironment(Environment environment) async {
    var baseUrl = '';
    switch (environment) {
      case Environment.stage:
        baseUrl = 'https://staging.api.helpdesk-app.com';
      case Environment.live:
        baseUrl = 'https://api.helpdesk-app.com';
      case Environment.dev:
        baseUrl = 'https://staging.api.helpdesk-app.com';
      case Environment.qa:
        baseUrl = 'https://staging.api.helpdesk-app.com';
      default:
        baseUrl = 'https://staging.api.helpdesk-app.com';
    }
    _currentEnvironment = EnvironmentConfig(
        baseUrl: baseUrl,
        dioClient: Dio(),
        httpHeaders: {},
        authorizationToken: '');
  }

  static EnvironmentConfig? getCurrentEnvironment() {
    return _currentEnvironment;
  }
}
