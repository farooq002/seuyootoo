import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_icon.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(());
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
        titleText: 'Progress & Evolution',
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
              borderColor: appAmber,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: appAmber,
              isShadowAvailable: true,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appImageAsset(icStreak, height: 40).paddingOnly(right: 8),
                      AppTextBold(
                        text: 'DAY 4 STREAK!',
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        color: appBlack,
                      ),
                    ],
                  ),
                  AppTextBold(
                    text: 'Keep it up for a Case Analysis Reward',
                    fontSize: 12,
                    textAlign: TextAlign.center,
                    color: Colors.black,
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
                children: [
                  AppAchievementContainer(
                    shadowColor: appWhite,
                    borderColor: appBlack,
                    width: MediaQuery.of(context).size.width * 0.9,
                    isShadowAvailable: true,
                    child: Column(
                      children: [
                        AppTextBold(
                          text: 'CURRENT LEVEL',
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          color: appAmber,
                        ).paddingSymmetric(vertical: 10),
                        AppTextBold(
                          text: 'Junior Paralegal',
                          fontSize: 12,
                          textAlign: TextAlign.center,
                          color: appWhite,
                        ),
                        AppTextBold(
                          text: 'LEVEL 4',
                          fontSize: 18,
                          textAlign: TextAlign.center,
                          color: appGreen,
                        ).paddingSymmetric(vertical: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextBold(
                              text: '5 level PROGRESS',
                              fontSize: 12,
                              color: appWhite,
                            ),
                            AppTextRegular(
                              text: '2750/5000',
                              fontSize: 12,
                              color: appBlue,
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
                              AppTextBold(
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
                        AppTextBold(
                          text: 'EARNED TOKENS',
                          fontSize: 14,
                          color: appLightBlueGray,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            appImageAsset(icFrame),
                            AppTextRegular(
                              text: '47',
                              fontSize: 24,
                              color: appWhite,
                            ).paddingSymmetric(horizontal: 8),
                          ],
                        ),
                        AppTextBold(
                          text: 'Use on sueyoutoo.com',
                          fontSize: 12,
                          color: appLightBlueGray,
                        ),
                      ],
                    ).paddingSymmetric(vertical: 10),
                  ).paddingSymmetric(vertical: 10),
                  AppAchievementContainer(
                    shadowColor: appWhite,
                    borderColor: appBlack,
                    isShadowAvailable: true,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        AppTextBold(
                          text: 'CASE RECORD',
                          fontSize: 14,
                          color: appLightBlueGray,
                        ).paddingSymmetric(vertical: 10),
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
                                      color: appWhite,
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
                                      ).paddingOnly(top: 10),
                                    ],
                                  ).paddingAll(10),
                                ),
                                AppTextBold(
                                  text: 'Wins',
                                  fontSize: 12,
                                  color: appLightBlueGray,
                                  textAlign: TextAlign.center,
                                ).paddingSymmetric(vertical: 10),
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
                                      color: appWhite,
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
                                      ).paddingOnly(top: 10),
                                    ],
                                  ).paddingAll(10),
                                ),
                                AppTextBold(
                                  text: 'Loses',
                                  fontSize: 12,
                                  color: appLightBlueGray,
                                  textAlign: TextAlign.center,
                                ).paddingSymmetric(vertical: 10),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).paddingSymmetric(vertical: 10),
                  AppAchievementContainer(
                    shadowColor: appWhite,
                    borderColor: appBlack,
                    isShadowAvailable: true,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        AppTextRegular(
                          text: 'ACHIEVEMENTS',
                          fontSize: 14,
                          color: appWhite,
                        ),
                        AppAchievementContainer(
                          isShadowAvailable: true,
                          isBorderAvailable: false,
                          color: appAmber,
                          child: Row(
                            children: [
                              appImageAsset(
                                icMedal,
                                height: 15,
                              ).paddingOnly(right: 8),
                              AppTextRegular(
                                text: 'Won 10 Cases',
                                fontSize: 12,
                              ),
                              const Spacer(),
                              appImageAsset(icCheck, color: appYellow),
                            ],
                          ).paddingAll(10),
                        ),
                        AppAchievementContainer(
                          isShadowAvailable: true,
                          isBorderAvailable: false,
                          color: appDimGreen,
                          child: Row(
                            children: [
                              appImageAsset(
                                icShield,
                                height: 15,
                              ).paddingOnly(right: 8),
                              AppTextRegular(
                                text: 'No Laws Broken',
                                fontSize: 12,
                              ),
                              const Spacer(),
                              appImageAsset(icCheck, color: appLightGreen),
                            ],
                          ).paddingAll(10),
                        ).paddingSymmetric(vertical: 10),
                        AppAchievementContainer(
                          isShadowAvailable: true,
                          isBorderAvailable: false,
                          color: appGray,
                          child: Row(
                            children: [
                              appImageAsset(
                                icStarBlack,
                                height: 15,
                                color: appLightGray,
                              ).paddingOnly(right: 8),
                              AppTextRegular(
                                text: 'Perfect Week',
                                fontSize: 12,
                                color: appLightGray,
                              ),
                              const Spacer(),
                              AppTextRegular(
                                text: '3/7',
                                fontSize: 12,
                                color: appLightGray,
                              ),
                            ],
                          ).paddingAll(10),
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 20),
                  AppAchievementContainer(
                    borderColor: appWhite,
                    isShadowAvailable: false,
                    color: appGreen,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: AppTextIcon(
                      text: 'View Active Cases',
                      onPressed: () {},
                      icon: appImageAsset(
                        tabCases,
                        color: appWhite,
                        height: 14,
                      ),
                      borderColor: appGreen,
                      fontSize: 14,
                      backgroundColor: appGreen,
                    ),
                  ),
                  AppAchievementContainer(
                    isShadowAvailable: false,
                    color: appAmber,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: AppTextIcon(
                      text: 'Start New Trial',
                      onPressed: () {},
                      icon: appImageAsset(icGame, color: appWhite, height: 14),
                      fontSize: 14,
                      backgroundColor: appAmber,
                      borderColor: appAmber,
                    ),
                  ).paddingOnly(top: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
