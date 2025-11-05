import 'package:souyoutoo/model/auth_models/login_model.dart';
import 'package:souyoutoo/model/auth_models/sign_up_model.dart';
import 'package:souyoutoo/remote/network_response.dart';

abstract base class AuthRepo {
  Future<NetworkResponse<LoginModel>?> login(Map<String, dynamic> data);

  // Future<NetworkResponse<SignUpModel>?> signUp(Map<String, dynamic> data);
  Future<NetworkResponse<SignUpModel>?> signUp(Map<String, dynamic> data);

  rememberMe({bool? rememberMe});

  forgotPassword(Map<String, dynamic> data);

  resetPassword(Map<String, dynamic> data);

  verifyOTP(Map<String, dynamic> data);

  resendOTP(Map<String, dynamic> data);

  Future<void> logout();
}
