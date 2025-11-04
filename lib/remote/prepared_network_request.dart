import 'dart:io';

import 'package:dio/dio.dart';
import 'network_request.dart';

class PreparedNetworkRequest<Model> {
  const PreparedNetworkRequest(this.request, this.parser, this.dio,
      this.headers, this.onSendProgress, this.onReceiveProgress, this.files);
  final NetworkRequest request;
  final Model Function(Map<String, dynamic>) parser;
  final Dio dio;
  final Map<String, dynamic> headers;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;
  final List<File>? files;

  static Map<String, dynamic> listToMap(dynamic data) {
    if (data is List) {
      return {"documents": data};
    }
    return data;
  }
}
