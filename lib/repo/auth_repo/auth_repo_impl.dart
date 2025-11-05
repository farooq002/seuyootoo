import 'package:flutter/material.dart';
import 'package:souyoutoo/model/auth_models/login_model.dart';
import 'package:souyoutoo/model/auth_models/sign_up_model.dart';
import 'package:souyoutoo/remote/network_request.dart';
import 'package:souyoutoo/remote/network_response.dart';
import 'package:souyoutoo/remote/network_service.dart';
import 'package:souyoutoo/repo/auth_repo/auth_repo.dart';

base class AuthRepoImpl extends AuthRepo {
  @override
  forgotPassword(Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  rememberMe({bool? rememberMe}) {
    // TODO: implement rememberMe
    throw UnimplementedError();
  }

  @override
  resendOTP(Map<String, dynamic> data) {
    // TODO: implement resendOTP
    throw UnimplementedError();
  }

  @override
  resetPassword(Map<String, dynamic> data) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  verifyOTP(Map<String, dynamic> data) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<LoginResponse>?> login(LoginRequest req) async {
    final request = NetworkRequest(
      path: NetworkService.authLogin,
      type: NetworkRequestType.POST,
      data: NetworkRequestBody.json(req.toMap()),
    );

    final response = await NetworkService.shared.execute<LoginResponse>(
      request,
      LoginResponse.fromMap
    );
    response?.maybeWhen(
      ok: (data) {
        print('Hurry Success');
      },
      orElse: (){
        print('Error');
      });

    return response;
  }

  @override
  Future<NetworkResponse<SignUpModel>?> signUp([
    Map<String, dynamic>? data,
  ]) async {
    final request = NetworkRequest(
      path: NetworkService.authSignUp,
      type: NetworkRequestType.POST,
      data: NetworkRequestBody.json(data ?? {}),
    );

    final response = await NetworkService.shared.execute<SignUpModel>(
      request,
      (json) => SignUpModel.fromMap(json),
    );
    // if (response != null) {
    //   response.maybeWhen(
    //     ok: (result) {
    //       debugPrint("done");
    //     },
    //     noData: (message) => debugPrint(message),
    //     noAccess: (message) => debugPrint(message),
    //     noAuth: (message) => debugPrint(message),
    //     noInternet: (message) => debugPrint(message),
    //     badRequest: (message) => debugPrint(message),
    //     orElse: () => debugPrint('Some Error Occurred'),
    //   );
    // }
    return response;
  }
}
