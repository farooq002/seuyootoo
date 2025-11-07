import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
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
                        text: 'SIGN UP',
                        fontSize: 24,
                        color: appWhite,
                      ),
                    ).paddingOnly(bottom: 10),
                    AppTextRegular(
                      text: 'Name',
                      fontFamily: 'VT323',
                      fontSize: 18,
                      color: appWhite,
                    ),
                    AppTextField(
                      textController: controller.nameController,
                      hintText: 'Enter your First Name(Optional)',
                      placeholderColor: appDimGray,
                    ).paddingOnly(bottom: 10),
                    AppTextRegular(
                      text: 'Email',
                      fontFamily: 'VT323',
                      fontSize: 18,
                      color: appWhite,
                    ),
                    AppTextField(
                      textController: controller.emailController,
                      validator: SouyouTooValidations.shared.email(),
                      hintText: 'Enter your email',
                      placeholderColor: appDimGray,
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
                        validator: SouyouTooValidations.shared.password(),
                        placeholderColor: appDimGray,
                        hintText: 'Enter your password',
                        isSecured: true,
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
                      ),
                    ),
                    AppElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final box = GetStorage();
                          box.write('isLoggedIn', true);
                          controller.signUp();
                          // Get.offAllNamed(homeRoute);
                        }
                      },
                      text: 'SIGN UP',
                      color: appAmber,
                      textColor: appDarkBrown,
                      textSize: 16,
                    ).paddingSymmetric(vertical: 10),
                    AppTextButton(
                      text: 'Already have an Account?',
                      onPressed: () => Get.back(),
                      isUnderline: true,
                      color: appWhite,
                      decorationColor: appWhite,
                      fontSize: 10,
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
                    ),
                    AppTextIcon(
                      onPressed: () {},
                      text: 'Continue with Google',
                      borderColor: appDarkBrown,
                      fontFamily: 'VT323',
                      fontSize: 18,
                      backgroundColor: appWhite,
                      foregroundColor: appDarkBrown,
                      icon: appImageAsset(icGoogle),
                    ).paddingSymmetric(vertical: 10),
                    AppTextIcon(
                      onPressed: () {},
                      text: 'Continue with Apple',
                      fontFamily: 'VT323',
                      fontSize: 18,
                      backgroundColor: appBlack,
                      foregroundColor: appWhite,
                      icon: appImageAsset(icApple),
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
