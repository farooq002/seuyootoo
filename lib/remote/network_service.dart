import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'environment_config.dart';
import 'global_config.dart';
import 'network_request.dart';
import 'network_response.dart';
import 'prepared_network_request.dart';

class NetworkService {
  static final shared = NetworkService();
  NetworkService() {
    if (GlobalConfig.getCurrentEnvironment() != null) {
      if (kDebugMode) {
        print('Environment must be set globally before using NetworkService');
      }
    }
  }

  //MARK: - CONCATENATED URLS DEFINED HERE AS STATIC
  static const authUrl = '/api/v1/auth/';
  static const authLogin = '${authUrl}login/helper';
  static const authSignUp = '${authUrl}register/helper';
  static const verifyOtp = '${authUrl}verifyotp';
  static const resendOtp = '${authUrl}resendotp';
  static const forgotPass = '${authUrl}forgot-password';
  static const resetPassword = '${authUrl}reset-password';
  static const logout = '${authUrl}logout';

  ///
  EnvironmentConfig get _currentEnvironment =>
      GlobalConfig.getCurrentEnvironment()!;

  Future<Dio> _getDefaultDioClient() async {
    final headers = _currentEnvironment.httpHeaders;
    headers['Content-Type'] = 'application/json';
    if (_currentEnvironment.authorizationToken != null &&
        _currentEnvironment.authorizationToken != '') {
      headers['Authorization'] =
          'Bearer ${_currentEnvironment.authorizationToken}';
    }
    final dio = _currentEnvironment.dioClient!
      ..options.baseUrl = _currentEnvironment.baseUrl
      ..options.headers = _currentEnvironment.httpHeaders
      ..options.connectTimeout =
          const Duration(seconds: 20) // 5 seconds
      ..options.receiveTimeout = const Duration(seconds: 20); // 3 seconds
    return dio;
  }

  void addBasicAuth(String accessToken) {
    _currentEnvironment.authorizationToken = accessToken;
    _currentEnvironment.httpHeaders['Authorization'] = 'Bearer $accessToken';
  }

  Future<NetworkResponse<Model>?> execute<Model>(
    NetworkRequest request,
    Model Function(Map<String, dynamic>) parser, {
    dio.ProgressCallback? onSendProgress,
    dio.ProgressCallback? onReceiveProgress,
    bool showProgress = true,
    List<File>? files,
  }) async {
    try {
      _currentEnvironment.dioClient = await _getDefaultDioClient();
      final req = PreparedNetworkRequest<Model>(
        request,
        parser,
        _currentEnvironment.dioClient!,
        {..._currentEnvironment.httpHeaders, ...(request.headers ?? {})},
        onSendProgress,
        onReceiveProgress,
        files,
      );
      final result = await compute(_executeRequest<Model>, req);
      return result;
    } catch (e) {
      debugPrint("Error during request execution: $e");
      return null;
    } finally {
      print('Done');
    }
  }

  Future<NetworkResponse<Model>> _executeRequest<Model>(
    PreparedNetworkRequest request,
  ) async {
    dio.FormData? formData;

    try {
      dynamic body = request.request.data?.whenOrNull(
        json: (data) => data,
        text: (data) => data,
      );
      if (request.files?.isNotEmpty == true) {
        List<dio.MultipartFile> fileList = [];
        for (var file in request.files!) {
          String fileName = file.path.split('/').last;
          fileList.add(
            await dio.MultipartFile.fromFile(file.path, filename: fileName),
          );
        }
        formData = dio.FormData.fromMap({"files": fileList});
      }
      debugPrint('Sending request to: ${request.request.path}');
      debugPrint('Request method: ${request.request.type.name}');
      debugPrint('Request headers: ${request.headers}');
      debugPrint('Request body: $body');
      debugPrint('Query parameters: ${request.request.queryParams}');
      debugPrint(
        'Sending request to: ${request.dio.options.baseUrl}${request.request.path}',
      );

      final response = await request.dio.request(
        request.request.path,
        data: request.files?.isNotEmpty == true ? formData : body,
        queryParameters: request.request.queryParams,
        options: dio.Options(
          method: request.request.type.name,
          headers: request.headers,
        ),
        onSendProgress: request.onSendProgress,
        onReceiveProgress: request.onReceiveProgress,
      );
      debugPrint(
        '--------------------- Response status ---------------------: ${response.statusCode}',
      );
      final dataMap = PreparedNetworkRequest.listToMap(response.data);
      debugPrint('Sending request to: ${request.parser(dataMap)}');
      return NetworkResponse.ok(request.parser(dataMap));
    } on dio.DioException catch (error) {
      final errorText = error.toString();
      if (error.requestOptions.cancelToken != null &&
          error.requestOptions.cancelToken!.isCancelled) {
        return NetworkResponse.noData(errorText);
      }
      final errorMsg = extractErrorMessage(error);
      if (errorMsg != null) {
        switch (error.response?.statusCode) {
          case 400:
            return NetworkResponse.badRequest(errorMsg);
          case 401:
            return NetworkResponse.noAuth(errorMsg);
          case 403:
            return NetworkResponse.noAccess(errorMsg);
          case 404:
            return NetworkResponse.notFound(errorMsg);
          case 409:
            return NetworkResponse.conflict(errorMsg);
          case 500:
            throw NetworkResponse.internalServerError(errorMsg);
          default:
            return NetworkResponse.noData(errorMsg);
        }
      } else {
        switch (error.response?.statusCode) {
          case 400:
            return NetworkResponse.badRequest("Bad request");
          case 401:
            return NetworkResponse.noAuth("Unauthorized");
          case 403:
            return NetworkResponse.noAccess("Forbidden");
          case 404:
            return NetworkResponse.notFound("Not found");
          case 409:
            return NetworkResponse.conflict("Conflict");
          case 500:
            return NetworkResponse.internalServerError("Internal server error");
          default:
            return NetworkResponse.noData("No Internet Access");
        }
      }
    } catch (error) {
      return NetworkResponse.noData(error.toString());
    }
  }

  String? extractErrorMessage(DioException error) {
    if (error.response != null &&
        error.response!.data is Map<String, dynamic>) {
      return error.response!.data['message'] ?? error.message;
    }
    return null;
  }
}
