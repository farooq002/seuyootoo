abstract base class AuthRepo {
  login();

  rememberMe({bool? rememberMe});

  forgotPassword(Map<String, dynamic> data);

  resetPassword(Map<String, dynamic> data);

  verifyOTP(Map<String, dynamic> data);

  resendOTP(Map<String, dynamic> data);

  Future<void> logout();
}
