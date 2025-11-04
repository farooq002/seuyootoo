import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_field.dart';
import 'package:souyoutoo/src/components/app_text_icon.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appLightPink,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: appImageAsset(icLogin)),
              Center(
                child: AppTextRegular(
                  text: 'LOGIN',
                  fontSize: 24,
                  color: appDarkBrown,
                ),
              ).paddingSymmetric(vertical: 10),
              AppTextRegular(
                text: 'Email',
                fontFamily: 'VT323',
                color: appDarkBrown,
                fontSize: 18,
              ).paddingSymmetric(vertical: 10),
              AppTextField(
                textController: TextEditingController(),
                outlineBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 5, color: appDarkBrown),
                  borderRadius: BorderRadius.zero,
                ),
                fontFamily: 'VT323',
                hintText: 'Enter your Email',

                backgroundColor: appWhite,
              ),
              AppTextRegular(
                text: 'Password',
                fontFamily: 'VT323',
                color: appDarkBrown,
                fontSize: 18,
              ).paddingSymmetric(vertical: 10),
              AppTextField(
                textController: TextEditingController(),
                outlineBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: appDarkBrown),
                  borderRadius: BorderRadius.zero,
                ),
                hintText: 'Enter your Password',
              ),
              AppElevatedButton(
                onPressed: () {
                  final box = GetStorage();
                  box.write('isLoggedIn', true);
                  Get.offAllNamed(homeRoute);
                },
                text: 'Login',
                color: appAmber,
                textColor: appDarkBrown,
                textSize: 16,
              ).paddingSymmetric(vertical: 10).paddingOnly(top: 10),
              AppTextButton(
                text: 'Forget Password',
                isUnderline: true,
                fontSize: 18,
                fontFamily: 'VT323',
                color: appDarkBrown,
                onPressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      height: 8,
                      thickness: 1.0,
                      color: appLightBrown,
                    ),
                  ),
                  const AppTextThin(
                    text: 'OR',
                    fontFamily: 'VT323',
                    color: appDarkBrown,
                    fontSize: 18,
                  ).paddingOnly(left: 4, right: 4),
                  const Expanded(
                    child: Divider(
                      height: 8,
                      thickness: 1.0,
                      color: appLightBrown,
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 12),
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
              ),
              AppTextButton(
                text: 'Don\'t have an Account?',
                onPressed: () => Get.toNamed(signUpRoute),
                isUnderline: true,
                fontSize: 10,
              ),
            ],
          ).paddingAll(10),
        ),
      ),
    );
  }
}
