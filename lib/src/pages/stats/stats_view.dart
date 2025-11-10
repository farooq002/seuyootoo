import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_progress_bar.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/components/sound_player.dart';

import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';
import 'package:souyoutoo/utils/sounds_constant.dart';

class StatsView extends StatelessWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(TabStatsViewController());
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: icBack,
        onLeftIconPress: () {
          Get.back();
        },
        titleText: 'Achievements',
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            bottom: 100,
            child: Image.asset(icBackground, fit: BoxFit.fill),
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
              child: Image.asset(icForeground, fit: BoxFit.fill),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: AppAchievementContainer(
              color: appWhite,
              borderColor: appWhite,
              shadowColor: appBlack,
              isShadowAvailable: true,
              child: Row(
                children: [
                  AppAchievementContainer(
                    color: appLightGray,
                    borderColor: appGray,
                    isShadowAvailable: false,
                    child: appImageAsset(
                      icSuitCase,
                      color: appGray,
                    ).paddingAll(10),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextRegular(
                          text: 'CASE GRINDER',
                          fontSize: 14,
                          fontFamily: 'VT323',
                        ),
                        AppTextRegular(
                          text: 'Complete 10 weekly goals.',
                          fontSize: 12,
                          fontFamily: 'VT323',
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AchievementProgressBar(
                              currentValue: 2750,
                              totalValue: 5000,
                            ),
                            AppTextRegular(
                              text: '7 / 10',
                              fontFamily: 'VT323',
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ).paddingOnly(left: 10),
                  ),
                ],
              ).paddingAll(10),
            ).paddingAll(10),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.43,
            bottom: 10,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(questionRoute),
                    child: AppAchievementContainer(
                      color: appWhite,
                      borderColor: appWhite,
                      shadowColor: appBlack,
                      isShadowAvailable: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Icon Container
                          AppAchievementContainer(
                            color: appAmber,
                            isBorderAvailable: false,
                            shadowColor: appGray,
                            isShadowAvailable: true,
                            child: appImageAsset(
                              tabTrial,
                              color: appBlack,
                              height: 30,
                            ).paddingAll(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'FIRST VICTORY',
                                fontSize: 18,
                                fontFamily: 'VT323',
                              ),
                              AppTextRegular(
                                text: 'You won your first case!',
                                fontSize: 14,
                                fontFamily: 'VT323',
                              ),
                            ],
                          ).paddingOnly(left: 10).paddingAll(10),
                          appImageAsset(icCheck, color: appDimGreen),
                          AppTextRegular(
                            text: 'Completed',
                            fontFamily: 'VT323',
                            fontSize: 14,
                          ),
                        ],
                      ).paddingAll(10),
                    ).paddingAll(10),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(mapRoute);
                      SoundManager.instance.play(icLevelUp);
                    },
                    child: AppAchievementContainer(
                      color: appWhite,
                      borderColor: appWhite,
                      shadowColor: appBlack,
                      isShadowAvailable: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Icon Container
                          AppAchievementContainer(
                            color: appAmber,
                            borderColor: appGray,
                            isBorderAvailable: false,
                            isShadowAvailable: true,
                            shadowColor: appGray,
                            child: appImageAsset(
                              icBook,
                              // color: appGray,
                              height: 24,
                            ).paddingAll(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'JUNIOR PARALEGAL',
                                fontSize: 18,
                                fontFamily: 'VT323',
                              ),
                              AppTextRegular(
                                text: 'Reached Level 5.',
                                fontSize: 14,
                                fontFamily: 'VT323',
                              ),
                            ],
                          ).paddingOnly(left: 10).paddingAll(10),
                          appImageAsset(icCheck, color: appDimGreen),
                          AppTextRegular(
                            text: 'Completed',
                            fontFamily: 'VT323',
                            fontSize: 14,
                          ),
                        ],
                      ).paddingAll(10),
                    ).paddingAll(10),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(profileRoute);
                      SoundManager.instance.play(icBackgroundSound);
                    },
                    child: AppAchievementContainer(
                      color: appWhite,
                      borderColor: appWhite,
                      shadowColor: appBlack,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Icon Container
                          AppAchievementContainer(
                            color: appAmber,
                            isBorderAvailable: false,
                            shadowColor: appGray,
                            child: appImageAsset(
                              icHat,
                              // color: appGray,
                              height: 24,
                            ).paddingAll(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'BOOKING',
                                fontSize: 18,
                                fontFamily: 'VT323',
                              ),
                              AppTextRegular(
                                text: 'Completed 10 Lessons.',
                                fontSize: 14,
                                fontFamily: 'VT323',
                              ),
                            ],
                          ).paddingOnly(left: 10).paddingAll(10),
                          appImageAsset(icCheck, color: appDimGreen),
                          AppTextRegular(
                            text: 'Completed',
                            fontFamily: 'VT323',
                            fontSize: 14,
                          ),
                        ],
                      ).paddingAll(10),
                    ).paddingAll(10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
