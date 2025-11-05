// import 'package:dio/dio.dart';

// class EnvironmentConfig {
//   final String baseUrl;
//   Dio? dioClient;
//   final Map<String, dynamic> httpHeaders;
//   String? authorizationToken;

//   EnvironmentConfig({
//     required this.baseUrl,
//     required this.dioClient,
//     required this.httpHeaders,
//     this.authorizationToken,
//   });
// }

import 'package:dio/dio.dart';

class EnvironmentConfig {
  String baseUrl;
  Map<String, dynamic> httpHeaders;
  String? authorizationToken;
  Dio? dioClient;

  EnvironmentConfig({
    required this.baseUrl,
    this.httpHeaders = const {},
    this.authorizationToken,
    Dio? dioClient,
  }) : dioClient = dioClient ?? Dio(); // 👈 ensure a non-null dio client
}
