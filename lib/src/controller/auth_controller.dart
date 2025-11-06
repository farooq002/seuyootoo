import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/model/auth_models/login_model.dart';
import 'package:souyoutoo/model/auth_models/sign_up_model.dart';
import 'package:souyoutoo/repo/auth_repo/auth_repo.dart';
import 'package:souyoutoo/repo/auth_repo/auth_repo_impl.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';
import 'package:souyoutoo/utils/constant.dart';

class AuthController extends BaseViewController {
  final AuthRepo repository = AuthRepoImpl();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final obscureText = true.obs;

  login() async {
    startLoading();
    var request = LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    );
    final response = await repository.login(request);
    if (response != null) {
      stopLoading();
      Get.offAllNamed(homeRoute);
      token = 'Token ${response.token!}';
    }

    stopLoading();
  }

  signUp() async {
    startLoading();
    final request = SignUpRequest(
      email: emailController.text,
      password: passwordController.text,
      passwordConfirm: passwordController.text,
      username: nameController.text,
    );
    final response = await repository.signUp(request);
    if (response != null) {
      stopLoading();
      Get.offAllNamed(homeRoute);
    }

    stopLoading();
  }
}
