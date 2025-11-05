import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/model/auth_models/login_model.dart';
import 'package:souyoutoo/repo/auth_repo/auth_repo.dart';
import 'package:souyoutoo/repo/auth_repo/auth_repo_impl.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';

class AuthController extends BaseViewController {
  final AuthRepo repository = AuthRepoImpl();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  login() async {
    startLoading();
    var request = LoginRequest(email: emailController.text, password: passwordController.text);
    final response = await repository.login(request);
    if (response != null) {
      stopLoading();
      Get.offAllNamed(homeRoute);
    }

    stopLoading();
  }

  signUp() async {
    startLoading();

    final response = await repository.signUp({
      "username": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "password_confirm": passwordController.text,
    });
    if (response != null) {
      stopLoading();
      // Get.offAllNamed(homeRoute);
    }

    stopLoading();
  }
}
