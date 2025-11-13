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

class TermsAndConditionsView extends BaseView<HomeController> {
  TermsAndConditionsView({super.key});
  @override
  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        titleText: 'Terms And Conditions',
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            bottom: 100,
            child: appImageAsset(icBackground, fit: BoxFit.fill),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height / 8,
            left: 0,
            right: 0,
            child: appImageAsset(icJudge, height: 250),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: 0.65,
              child: appImageAsset(icForeground, fit: BoxFit.fill),
            ),
          ),

          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: AppAchievementContainer(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: appLightYellow,
              shadowColor: appAmber,
              borderColor: appLightYellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appImageAsset(
                    icBattery,
                    height: 40,
                    color: appBlack,
                  ).paddingOnly(right: 8),
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
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.43,
            bottom: 10,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
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
                        Row(
                          children: [
                            const Icon(
                              Icons.info,
                              color: appBlack,
                              size: 18,
                            ).paddingOnly(right: 8),
                            AppTextRegular(
                              text: 'Introduction',
                              fontSize: 12,

                              color: appBlack,
                            ),
                          ],
                        ).paddingOnly(bottom: 6),
                        AppTextRegular(
                          text:
                              'Welcome to SouYouToo. These Terms and Conditions govern your use of our services and website. By using our services, you agree to be bound by these terms.',
                          fontSize: 9,
                          color: appBlack,
                        ).paddingOnly(bottom: 14),

                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: appBlack,
                              size: 18,
                            ).paddingOnly(right: 8),
                            AppTextRegular(
                              text: 'Acceptance of Terms',
                              fontSize: 12,

                              color: appBlack,
                            ),
                          ],
                        ).paddingOnly(bottom: 6),
                        AppTextRegular(
                          text:
                              'By creating an account or using our services, you acknowledge that you have read, understood, and agree to these Terms and Conditions. If you do not agree, please discontinue use immediately.',
                          fontSize: 9,
                          color: appBlack,
                        ).paddingOnly(bottom: 14),

                        Row(
                          children: [
                            const Icon(Icons.person, color: appBlack, size: 18),
                            AppTextRegular(
                              text: 'User Responsibilities',
                              fontSize: 12,

                              color: appBlack,
                            ),
                          ],
                        ).paddingOnly(bottom: 6),
                        AppTextRegular(
                          text:
                              '• Provide accurate and truthful information\n• Maintain confidentiality of account credentials\n• Use services for lawful purposes only\n• Respect intellectual property rights',
                          fontSize: 9,
                          color: appBlack,
                        ).paddingOnly(bottom: 14),

                        Row(
                          children: [
                            appImageAsset(
                              tabTrial,
                              color: appBlack,
                              height: 18,
                            ).paddingOnly(right: 8),
                            AppTextRegular(
                              text: 'Service Description',
                              fontSize: 12,

                              color: appBlack,
                            ),
                          ],
                        ).paddingOnly(bottom: 6),
                        AppTextRegular(
                          text:
                              'SouYouToo provides legal case management tools and resources. We facilitate case tracking, document management, and communication between users and legal professionals. We do not provide legal advice.',
                          fontSize: 9,
                          color: appBlack,
                        ).paddingOnly(bottom: 14),

                        Row(
                          children: [
                            const Icon(
                              Icons.lock_outline,
                              color: appBlack,
                              size: 18,
                            ).paddingOnly(right: 8),
                            AppTextRegular(
                              text: 'Privacy & Data',
                              fontSize: 12,

                              color: appBlack,
                            ),
                          ],
                        ).paddingOnly(bottom: 6),
                        AppTextRegular(
                          text:
                              'Your privacy is important to us. We collect and process personal information in accordance with our Privacy Policy. By using our services, you consent to data processing as described.',
                          fontSize: 9,
                          color: appBlack,
                        ).paddingOnly(bottom: 14),

                        Row(
                          children: [
                            const Icon(
                              Icons.block_outlined,
                              color: appBlack,
                              size: 18,
                            ).paddingOnly(right: 8),
                            AppTextRegular(
                              text: 'Prohibited Activities',
                              fontSize: 12,

                              color: appBlack,
                            ),
                          ],
                        ).paddingOnly(bottom: 6),
                        AppTextRegular(
                          text:
                              '• Misuse of platform for illegal activities\n• Harassment or abuse of other users\n• Attempting to breach security measures\n• Sharing false or misleading information',
                          fontSize: 9,
                          color: appBlack,
                        ).paddingOnly(bottom: 14),

                        Row(
                          children: [
                            const Icon(
                              Icons.scale_outlined,
                              color: appBlack,
                              size: 18,
                            ).paddingOnly(right: 8),
                            AppTextRegular(
                              text: 'Limitation of Liability',
                              fontSize: 12,

                              color: appBlack,
                            ),
                          ],
                        ).paddingOnly(bottom: 6),
                        AppTextRegular(
                          text:
                              'SouYouToo shall not be liable for any indirect, incidental, special, or consequential damages. Our liability is limited to the maximum extent permitted by law.',
                          fontSize: 9,
                          color: appBlack,
                        ).paddingOnly(bottom: 14),

                        Row(
                          children: [
                            const Icon(
                              Icons.cancel_outlined,
                              color: appBlack,
                              size: 18,
                            ).paddingOnly(right: 8),
                            AppTextRegular(
                              text: 'Termination',
                              fontSize: 12,
                              color: appBlack,
                            ),
                          ],
                        ).paddingOnly(bottom: 6),
                        AppTextRegular(
                          text:
                              'We reserve the right to suspend or terminate accounts for violations of these terms. Users may terminate their accounts at any time through the app settings.',
                          fontSize: 9,
                          color: appBlack,
                        ).paddingOnly(bottom: 14),

                        Row(
                          children: [
                            const Icon(
                              Icons.edit_note_outlined,
                              color: appBlack,
                              size: 18,
                            ).paddingOnly(right: 8),
                            AppTextRegular(
                              text: 'Changes to Terms',
                              fontSize: 12,

                              color: appBlack,
                            ),
                          ],
                        ).paddingOnly(bottom: 6),
                        AppTextRegular(
                          text:
                              'We may update these Terms and Conditions periodically. Users will be notified of significant changes. Continued use after updates constitutes acceptance of new terms.',
                          fontSize: 9,
                          color: appBlack,
                        ).paddingOnly(bottom: 14),

                        Row(
                          children: [
                            const Icon(
                              Icons.phone_in_talk_outlined,
                              color: appBlack,
                              size: 18,
                            ).paddingOnly(right: 8),
                            AppTextRegular(
                              text: 'Contact Information',
                              fontSize: 12,

                              color: appBlack,
                            ),
                          ],
                        ).paddingOnly(bottom: 6),
                        AppTextRegular(
                          text:
                              'For questions about these Terms and Conditions:',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Email: legal@souyoutoo.com',
                          fontSize: 9,
                          color: appBlack,
                        ),
                        AppTextRegular(
                          text: 'Phone: 1-800-SYOU-HELP',
                          fontSize: 9,
                          color: appBlack,
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 20),
                  AppTextIcon(
                    onPressed: () {},
                    icon: appImageAsset(icCheck),
                    text: 'I Accept These Terms',
                    offSetX: -6,
                    offSetY: -6,
                    backgroundColor: appGreen,
                    foregroundColor: appWhite,
                  ).paddingSymmetric(vertical: 10),

                  AppTextIcon(
                    onPressed: () {},
                    icon: appImageAsset(icDownload),
                    text: 'Download PDF Copy',
                    foregroundColor: appWhite,
                    offSetX: -6,
                    offSetY: -6,
                    backgroundColor: appBlue,
                  ).paddingSymmetric(vertical: 10),

                  Center(
                    child: AppTextRegular(
                      text:
                          'Terms Version 2.1\n© 2024 SouYouToo. All Rights Reserved.',
                      fontSize: 10,

                      color: appWhite,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ).paddingAll(32),
            ),
          ),
        ],
      ),
    );
  }
}
