import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_icon.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/controller/home/home_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class PrivacyPolicyView extends BaseView<HomeController> {
  PrivacyPolicyView({super.key});
  @override
  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        titleText: 'SUPPORT',
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
      ),

      backgroundColor: appBrown,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(icTop),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                children: [
                  AppAchievementContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // appImageAsset(
                        //   icBattery,
                        //   height: 40,
                        //   color: appBlack,
                        // ).paddingOnly(right: 8),
                        Icon(Icons.shield),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextRegular(
                              text: 'Last Updated',
                              fontSize: 12,
                              textAlign: TextAlign.center,
                              color: appBlack,
                            ),
                            AppTextRegular(
                              text: 'December 1, 2024',
                              fontSize: 10,
                              textAlign: TextAlign.center,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(10),
                  ).marginOnly(top: 10),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(icBottom),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextRegular(
                          text: '1. Introduction',
                          fontSize: 12,

                          color: appBlack,
                        ),

                        AppTextRegular(
                          text:
                              'SueYouToo ("we," "our," or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application and website.',
                          fontSize: 9,
                          color: appBlack,
                        ).paddingOnly(bottom: 14),
                      ],
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextRegular(
                          text: '2. Information We Collect',
                          fontSize: 12,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Personal Information:',
                          fontSize: 12,
                          color: appBlack,
                        ),

                        AppTextRegular(
                          text: 'Name and contact information',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Email address and phone number',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Account credentials Case-related information',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Technical Information:',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text:
                              'Device information and identifiers Usage data and analytics, Location data (when permitted)',
                          fontSize: 9,
                          color: appBlack,
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 20),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextRegular(
                          text: '3. How We Use Your Information',
                          fontSize: 12,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Provide and maintain our services',
                          fontSize: 12,
                          color: appBlack,
                        ),

                        AppTextRegular(
                          text: 'Process legal cases and documentation',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Send notifications and updates',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Improve our app functionality',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Ensure security and prevent fraud',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Comply with legal obligations',
                          fontSize: 9,
                          color: appBlack,
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextRegular(
                          text: '4. Information Sharing',
                          fontSize: 12,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text:
                              'We do not sell, trade, or rent your personal information.',
                          fontSize: 12,
                          color: appBlack,
                        ),

                        AppTextRegular(
                          text: 'We may share information with:',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Legal professionals handling your case',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Service providers and partners',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Law enforcement (when required)',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Courts and legal authorities',
                          fontSize: 9,
                          color: appBlack,
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 20),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextRegular(
                          text: '5. Data Security',
                          fontSize: 12,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text:
                              'We implement appropriate security measures to protect your information against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet is 100% secure.',
                          fontSize: 9,
                          color: appBlack,
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextRegular(
                          text: '6. Your Rights',
                          fontSize: 12,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'You have the right to:',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Access your personal information',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text:
                              'Correct inaccurate data Request deletion of your data Withdraw consent Data portability',
                          fontSize: 9,
                          color: appBlack,
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 20),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextRegular(
                          text: '7. Contact Us',
                          fontSize: 12,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'For privacy-related questions:',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Email: privacy@sueyoutoo.com',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Address: 123 Legal Street, Law City, LC 12345',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Phone: (555) 123-4567',
                          fontSize: 9,
                          color: appBlack,
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextRegular(
                          text: '8. Policy Updates',
                          fontSize: 12,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text:
                              'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new policy on this page and updating the \"Last updated\" date.',
                          fontSize: 9,
                          color: appBlack,
                        ),
                      ],
                    ).paddingAll(10),
                  ),

                  AppTextIcon(
                    onPressed: () {},
                    icon: appImageAsset(icCheck),
                    text: 'I Accept Privacy \nPolicy',
                    offSetX: -6,
                    offSetY: -6,
                    backgroundColor: appGreen,
                    textAlign: TextAlign.center,
                    foregroundColor: appWhite,
                  ).paddingSymmetric(vertical: 20),

                  AppTextIcon(
                    onPressed: () {},
                    icon: appImageAsset(icDownload),
                    text: 'Download PDF Copy',
                    foregroundColor: appWhite,
                    textAlign: TextAlign.center,
                    offSetX: -6,
                    offSetY: -6,
                    backgroundColor: appBlue,
                  ),
                ],
              ).paddingAll(42),
            ),
          ],
        ),
      ),
    );
  }
}
