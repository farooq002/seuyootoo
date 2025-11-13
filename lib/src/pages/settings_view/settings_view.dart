import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_icon.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/components/round_background.dart';
import 'package:souyoutoo/src/controller/home/home_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class SettingView extends BaseView<HomeController> {
  SettingView({super.key});

  @override
  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        titleText: 'SETTINGS',
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person),
                            AppTextRegular(text: 'PROFILE', fontSize: 18),
                          ],
                        ),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextRegular(
                                    text: 'Username',
                                    fontSize: 12,
                                  ),
                                  Obx(
                                    () => AppTextRegular(
                                      text:
                                          controller
                                              .profileData
                                              .value
                                              .userEmail ??
                                          '',
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextRegular(text: 'Email', fontSize: 12),
                                  Obx(
                                    () => AppTextRegular(
                                      text:
                                          controller
                                              .profileData
                                              .value
                                              .userEmail ??
                                          '',
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ).paddingSymmetric(vertical: 10),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              AppTextRegular(
                                text: 'Change Password',
                                fontSize: 12,
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.notifications),
                            AppTextRegular(text: 'Notification', fontSize: 18),
                          ],
                        ),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              Column(
                                children: [
                                  AppTextRegular(
                                    text: 'Push Notifications',
                                    fontSize: 12,
                                  ),
                                  AppTextRegular(
                                    text: 'Case updates & alerts',
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    controller.selectedIndex.value =
                                        !controller.selectedIndex.value;
                                  },
                                  child: appImageAsset(
                                    controller.selectedIndex.value
                                        ? icEnabled
                                        : icDisabled,
                                    width: 40,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ).paddingAll(10),
                        ),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextRegular(
                                    text: 'Email Notifications',
                                    fontSize: 10,
                                  ),
                                  AppTextRegular(
                                    text: 'Important updates only',
                                    fontSize: 9,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    controller.selectedIndex.value =
                                        !controller.selectedIndex.value;
                                  },
                                  child: appImageAsset(
                                    controller.selectedIndex.value
                                        ? icEnabled
                                        : icDisabled,
                                    width: 40,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ).paddingAll(10),
                        ).paddingSymmetric(vertical: 10),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              Column(
                                children: [
                                  AppTextRegular(
                                    text: 'Marketing Emails',
                                    fontSize: 12,
                                  ),
                                  AppTextRegular(
                                    text: 'Tips & promotions',
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    controller.selectedIndex.value =
                                        !controller.selectedIndex.value;
                                  },
                                  child: appImageAsset(
                                    controller.selectedIndex.value
                                        ? icEnabled
                                        : icDisabled,
                                    width: 40,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ).paddingAll(10),
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 20),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.settings),
                            AppTextRegular(text: 'App Settings', fontSize: 18),
                          ],
                        ),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              Column(
                                children: [
                                  AppTextRegular(
                                    text: 'Dark Mode',
                                    fontSize: 12,
                                  ),
                                  AppTextRegular(
                                    text: 'Switch theme',
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    controller.selectedIndex.value =
                                        !controller.selectedIndex.value;
                                  },
                                  child: appImageAsset(
                                    controller.selectedIndex.value
                                        ? icEnabled
                                        : icDisabled,
                                    width: 40,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ).paddingAll(10),
                        ),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextRegular(
                                    text: 'Auto-Sync',
                                    fontSize: 12,
                                  ),
                                  AppTextRegular(
                                    text: 'Sync case data',
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    controller.selectedIndex.value =
                                        !controller.selectedIndex.value;
                                  },
                                  child: appImageAsset(
                                    controller.selectedIndex.value
                                        ? icEnabled
                                        : icDisabled,
                                    width: 40,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ).paddingAll(10),
                        ).paddingSymmetric(vertical: 10),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              Column(
                                children: [
                                  AppTextRegular(
                                    text: 'Language',
                                    fontSize: 12,
                                  ),
                                  AppTextRegular(
                                    text: 'English (US)',
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.help).paddingOnly(right: 10),
                            AppTextRegular(text: 'Support', fontSize: 18),
                          ],
                        ),
                        BackgroundBox(
                          onTap: () => Get.toNamed(createTicketRoute),
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              AppTextRegular(text: 'Help Center', fontSize: 12),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ),
                        BackgroundBox(
                          onTap: () => Get.toNamed(helpRoute),
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              AppTextRegular(
                                text: 'Contact Support',
                                fontSize: 12,
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ).paddingSymmetric(vertical: 10),
                        BackgroundBox(
                          onTap: () => Get.toNamed(privacyPolicyRoute),
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              AppTextRegular(
                                text: 'Privacy Policy',
                                fontSize: 12,
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ),
                        BackgroundBox(
                          onTap: () => Get.toNamed(termsAndConditionsRoute),
                          backGroundColor: appLightYellow,
                          data: Row(
                            children: [
                              AppTextRegular(
                                text: 'Terms of Service',
                                fontSize: 12,
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ).paddingSymmetric(vertical: 10),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 20),
                  AppTextIcon(
                    text: 'Logout',
                    onPressed: () {},
                    icon: Icon(Icons.logout, color: appWhite),
                    backgroundColor: appRed,
                    foregroundColor: appWhite,
                    fontSize: 14,
                    offSetX: -6,
                    offSetY: -6,
                    borderColor: appBlack,
                  ),
                  Center(
                    child: AppTextRegular(
                      text: 'SueYouToo App v1.2.3',
                      fontSize: 10,
                      color: appWhite,
                    ),
                  ).paddingOnly(top: 20),
                  Center(
                    child: AppTextRegular(
                      text: '© 2024 All Rights Reserved',
                      fontSize: 10,
                      color: appWhite,
                    ),
                  ),
                ],
              ).paddingAll(42),
            ),
          ),
        ],
      ),
    );
  }
}
