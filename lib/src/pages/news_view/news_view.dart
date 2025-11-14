import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/controller/home/home_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class NewsView extends BaseView<HomeController> {
  NewsView({super.key});

  @override
  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
        titleText: 'Progress & Evolution',
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
                    borderColor: appAmber,
                    margin: const EdgeInsets.only(top: 16),
                    color: appAmber,
                    isShadowAvailable: true,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            appImageAsset(
                              icStreak,
                              height: 20,
                            ).paddingOnly(right: 8),
                            Obx(
                              () => AppTextRegular(
                                text:
                                    'DAY ${controller.profileData.value.streak ?? 0} STREAK!',
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                color: appBlack,
                              ),
                            ),
                          ],
                        ),
                        AppTextRegular(
                          text: 'Keep it up for a Case Analysis Reward',
                          fontSize: 12,
                          textAlign: TextAlign.center,
                          color: Colors.black,
                        ),
                      ],
                    ).paddingAll(6),
                  ).paddingSymmetric(horizontal: 32),
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
                children: [
                  AppAchievementContainer(
                    shadowColor: appWhite,
                    borderColor: appBlack,
                    isShadowAvailable: true,
                    child: Column(
                      children: [
                        AppTextRegular(
                          text: 'CURRENT LEVEL',
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          color: appAmber,
                        ).paddingSymmetric(vertical: 10),
                        Obx(
                          () => AppTextRegular(
                            text:
                                controller
                                    .profileData
                                    .value
                                    .lexStatus
                                    ?.status ??
                                '',
                            fontSize: 12,
                            textAlign: TextAlign.center,
                            color: appWhite,
                          ),
                        ),
                        AppTextRegular(
                          text:
                              'LEVEL ${controller.profileData.value.level ?? 0}',
                          fontSize: 18,
                          textAlign: TextAlign.center,
                          color: appGreen,
                        ).paddingSymmetric(vertical: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => AppTextRegular(
                                text:
                                    'XP: ${controller.profileData.value.exp ?? 0}',
                                fontSize: 12,
                                color: appWhite,
                              ),
                            ),
                            Obx(
                              () => AppTextRegular(
                                text:
                                    'Next: ${controller.profileData.value.expToNextLevel ?? 0}',
                                fontSize: 12,
                                color: appBlue,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final progressWidth =
                                  constraints.maxWidth * (2750 / 5000);
                              return Stack(
                                children: [
                                  Container(color: Colors.white),
                                  Container(
                                    width: progressWidth,
                                    color: appGreen,
                                  ),
                                ],
                              );
                            },
                          ),
                        ).paddingSymmetric(vertical: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: appBlue,
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                          child: Column(
                            children: [
                              AppTextRegular(
                                text: 'WEEKLY LEARNING GOAL',
                                fontSize: 12,
                                color: appLightBlueGray,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppTextRegular(
                                    text: 'Cases Completed:',
                                    fontSize: 12,
                                    color: appWhite,
                                  ),
                                  AppTextRegular(
                                    text: '5/7',
                                    fontSize: 12,
                                    color: appGreen,
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 8),
                            ],
                          ).paddingAll(10),
                        ).paddingOnly(bottom: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: appGreen,
                                    border: Border.all(
                                      color: appDarkGreen,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      appImageAsset(icTrophy),
                                      AppTextRegular(
                                        text: '23',
                                        fontSize: 20,
                                        color: appWhite,
                                      ),
                                      AppTextRegular(
                                        text: 'Wins',
                                        fontSize: 12,
                                        color: appLightBlueGray,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ).paddingAll(10),
                                ),
                              ],
                            ).paddingOnly(right: 10),
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: appRed,
                                    border: Border.all(
                                      color: appDarkRed,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      appImageAsset(tabTrial),
                                      AppTextRegular(
                                        text: '7',
                                        fontSize: 20,
                                        color: appWhite,
                                      ),
                                      AppTextRegular(
                                        text: 'Loses',
                                        fontSize: 12,
                                        color: appLightBlueGray,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ).paddingAll(10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 16),
                  ).paddingSymmetric(vertical: 10),
                  AppAchievementContainer(
                    shadowColor: appWhite,
                    borderColor: appBlue,
                    isShadowAvailable: true,
                    color: appBlue,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        AppTextRegular(
                          text: 'EARNED TOKENS',
                          fontSize: 14,
                          color: appLightBlueGray,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            appImageAsset(icFrame),
                            Obx(
                              () => AppTextRegular(
                                text:
                                    '${controller.profileData.value.tokens ?? 0}',
                                fontSize: 24,
                                color: appWhite,
                              ).paddingSymmetric(horizontal: 8),
                            ),
                          ],
                        ),
                        AppTextRegular(
                          text: 'Use on sueyoutoo.com',
                          fontSize: 12,
                          color: appLightBlueGray,
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),
                  ).paddingSymmetric(vertical: 10),
                ],
              ).paddingAll(32),
            ).paddingOnly(right: 2),
          ],
        ),
      ),
    );
  }
}
