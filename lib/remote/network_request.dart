// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_request.freezed.dart';

@freezed
class NetworkRequestBody with _$NetworkRequestBody {
  const factory NetworkRequestBody.empty() = Empty;
  const factory NetworkRequestBody.json(Map<String, dynamic> data) = Json;
  const factory NetworkRequestBody.text(String data) = Text;
}

enum NetworkRequestType { GET, POST, PUT, PATCH, DELETE }

class NetworkRequest {
  const NetworkRequest({
    required this.type,
    required this.path,
    this.data,
    this.queryParams,
    this.headers,
  });

  final NetworkRequestType type;
  final String path;
  final NetworkRequestBody? data;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
}
