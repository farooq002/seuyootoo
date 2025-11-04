import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:souyoutoo/components/app_button.dart';
import 'package:souyoutoo/components/app_image.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/components/app_text_field.dart';
import 'package:souyoutoo/components/app_text_icon.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                  text: 'SIGN UP',
                  fontSize: 24,
                  color: appDarkBrown,
                ),
              ),
              AppTextRegular(
                text: 'Name',
                fontFamily: 'VT323',
                fontSize: 18,
                color: appDarkBrown,
              ),
              AppTextField(
                textController: TextEditingController(),
                textFieldPadding: 10,
                outlineBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: appDarkBrown),
                  borderRadius: BorderRadius.zero,
                ),
                hintText: 'Enter your First Name',
              ),
              AppTextRegular(
                text: 'Email',
                fontFamily: 'VT323',
                fontSize: 18,
                color: appDarkBrown,
              ),
              AppTextField(
                textController: TextEditingController(),
                textFieldPadding: 10,
                outlineBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: appDarkBrown),
                  borderRadius: BorderRadius.zero,
                ),
                hintText: 'Enter your email',
              ),
              AppTextRegular(
                text: 'Password',
                fontFamily: 'VT323',
                color: appDarkBrown,
                fontSize: 18,
              ),
              AppTextField(
                textController: TextEditingController(),
                textFieldPadding: 10,
                outlineBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: appDarkBrown),
                  borderRadius: BorderRadius.zero,
                ),
                hintText: 'Enter your password',
              ),
              AppElevatedButton(
                onPressed: () {
                  final box = GetStorage();
                  box.write('isLoggedIn', true);
                  Get.offAllNamed(homeRoute);
                },
                text: 'SIGN UP',
                color: appAmber,
                textColor: appDarkBrown,
                textSize: 16,
              ),
              AppTextButton(
                text: 'Already have an Account?',
                onPressed: () => Get.toNamed(loginRoute),
                isUnderline: true,
                color: appDarkBrown,
                fontSize: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Divider(height: 8, thickness: 1.0)),
                  const AppTextThin(
                    text: 'OR',
                    fontFamily: 'VT323',
                    color: appDarkBrown,
                    fontSize: 18,
                  ).paddingOnly(left: 4, right: 4),
                  const Expanded(child: Divider(height: 8, thickness: 1.0)),
                ],
              ).paddingOnly(bottom: 12),
              AppTextIcon(
                onPressed: () {},
                text: 'Continue with Google',
                borderColor: appDarkBrown,
                fontFamily: 'VT323',
                fontSize: 18,
                backgroundColor: appWhite,
                foregroundColor: appDarkBrown,
                icon: appImageAsset(icGoogle),
              ),
              AppTextIcon(
                onPressed: () {},
                text: 'Continue with Google',
                fontFamily: 'VT323',
                fontSize: 18,
                backgroundColor: appBlack,
                foregroundColor: appWhite,
                icon: appImageAsset(icApple),
              ),
            ],
          ).paddingAll(10).paddingOnly(top: 5),
        ),
      ),
    );
  }
}
