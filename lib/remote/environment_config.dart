import 'package:dio/dio.dart';

class EnvironmentConfig {
  final String baseUrl;
  Dio? dioClient;
  final Map<String, dynamic> httpHeaders;
  String? authorizationToken;

  EnvironmentConfig({
    required this.baseUrl,
    required this.dioClient,
    required this.httpHeaders,
    this.authorizationToken,
  });
}
