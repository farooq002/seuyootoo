import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_field.dart';
import 'package:souyoutoo/src/components/app_text_icon.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/controller/auth/auth_controller.dart';
import 'package:souyoutoo/src/extensions/validation+extension.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class LoginView extends BaseView<AuthController> {
  LoginView({super.key});
  @override
  final controller = Get.put(AuthController());
  @override
  Widget mBuild(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          appImageAsset(icSplashScreen, fit: BoxFit.cover),
          Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: AppTextRegular(
                        text: 'LOGIN',
                        fontSize: 24,
                        color: appWhite,
                      ),
                    ).paddingSymmetric(vertical: 10),
                    AppTextRegular(
                      text: 'Email',
                      fontFamily: 'VT323',
                      color: appWhite,
                      fontSize: 18,
                    ).paddingSymmetric(vertical: 10),
                    AppTextField(
                      textController: controller.emailController,
                      validator: SouyouTooValidations.shared.email(),
                      outlineBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: appDarkYellow),
                        borderRadius: BorderRadius.zero,
                      ),
                      fontFamily: 'VT323',
                      hintText: 'Enter your Email',
                      placeholderColor: appDimGray,

                      backgroundColor: appWhite,
                    ).paddingOnly(bottom: 10),
                    AppTextRegular(
                      text: 'Password',
                      fontFamily: 'VT323',
                      color: appWhite,
                      fontSize: 18,
                    ),
                    Obx(
                      () => AppTextField(
                        textController: controller.passwordController,
                        // validator: SouyouTooValidations.shared.password(),
                        outlineBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: appDarkYellow,
                          ),
                          borderRadius: BorderRadius.zero,
                        ),
                        isSecured: true,
                        placeholderColor: appDimGray,
                        obscureText: controller.obscureText.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            controller.obscureText.toggle();
                          },
                        ),
                        hintText: 'Enter your Password',
                      ),
                    ).paddingOnly(bottom: 10),
                    AppElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                      text: 'Login',
                      color: appAmber,
                      textColor: appDarkBrown,
                      textSize: 16,
                    ).paddingOnly(top: 10),
                    AppTextButton(
                      text: 'Forget Password',
                      isUnderline: true,
                      fontSize: 18,
                      fontFamily: 'VT323',
                      color: appWhite,
                      decorationColor: appWhite,
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Divider(
                            height: 8,
                            thickness: 1.0,
                            color: appOftenWhite,
                          ),
                        ),
                        const AppTextThin(
                          text: 'OR',
                          fontFamily: 'VT323',
                          color: appWhite,
                          fontSize: 18,
                        ).paddingOnly(left: 4, right: 4),
                        const Expanded(
                          child: Divider(
                            height: 8,
                            thickness: 1.0,
                            color: appOftenWhite,
                          ),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),
                    AppTextIcon(
                      onPressed: () {},
                      text: 'Continue with Google',
                      fontFamily: 'VT323',
                      fontSize: 18,
                      backgroundColor: appWhite,
                      foregroundColor: appDarkBrown,
                      icon: appImageAsset(icGoogle),
                    ),
                    AppTextIcon(
                      onPressed: () {},
                      text: 'Continue with Apple',
                      fontFamily: 'VT323',
                      fontSize: 18,
                      backgroundColor: appBlack,
                      foregroundColor: appWhite,
                      icon: appImageAsset(icApple),
                    ).paddingSymmetric(vertical: 10),
                    Center(
                      child: AppTextRegular(
                        text: 'Don\'t have an Account?',
                        fontSize: 18,
                        fontFamily: 'VT323',
                        color: appWhite,
                      ),
                    ),
                    AppTextButton(
                      text: 'Sign Up',
                      onPressed: () => Get.toNamed(signUpRoute),
                      isUnderline: true,
                      color: appWhite,
                      decorationColor: appWhite,
                      fontSize: 16,
                      fontFamily: 'VT323',
                    ),
                  ],
                ).paddingAll(42),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
