import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';

import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_progress_bar.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_icon.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

import 'home_view_controller.dart';

class HomeView extends BaseView<TabHomeViewController> {
  HomeView({super.key});

  @override
  final controller = Get.isRegistered<TabHomeViewController>()
      ? Get.find<TabHomeViewController>()
      : Get.put(TabHomeViewController());

  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        titleText: 'SOUYOUTOO',
        centerTitle: false,
        leftIconSvg: null,
        customButton: AppTextIcon(
          icon: appImageAsset(icStreak),
          onPressed: () {},
          text: '${controller.streak.value} DAY STREAK',
          fontSize: 12,
          foregroundColor: appWhite,
          borderColor: appBlack,
          backgroundColor: appBlack,
          shadowColor: appBlack,
        ),
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
              onTap: () => Get.toNamed(statsRoute),
              borderColor: appWhite,
              shadowColor: appBlack,
              color: appWhite,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextRegular(
                          text:
                              '${controller.profileData.value.level ?? 1} level PROGRESS',
                          fontSize: 10,
                          color: Colors.black,
                        ),
                        AppTextRegular(
                          text:
                              '${controller.profileData.value.exp ?? 0}/${controller.profileData.value.expToNextLevel ?? 1}',
                          fontSize: 8,
                          color: Colors.blue[700]!,
                        ),
                      ],
                    ).paddingOnly(bottom: 6),
                  ),

                  Obx(
                    () => AchievementProgressBar(
                      currentValue: controller.profileData.value.exp ?? 0.0,
                      totalValue:
                          controller.profileData.value.expToNextLevel ?? 1.0,
                    ),
                  ),
                ],
              ).paddingAll(10),
            ).paddingOnly(top: 10, left: 42, right: 42),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            bottom: MediaQuery.of(Get.context!).size.height * 0.01,
            left: MediaQuery.of(Get.context!).size.width * 0.10,
            right: MediaQuery.of(Get.context!).size.width * 0.10,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                        decoration: BoxDecoration(
                          color: appAmber,
                          border: Border.all(color: appWhite, width: 2),
                        ),
                        child: AppTextRegular(
                          text: '"Ready for today\'s case?"',
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          color: appBlack,
                        ).paddingAll(6),
                      )
                      .paddingSymmetric(horizontal: 24)
                      .paddingOnly(
                        bottom: MediaQuery.of(Get.context!).size.height * 0.01,
                      ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: appGreen,
                          border: Border.all(color: appWhite, width: 2),
                        ),
                        height: 25,
                        width: 25,
                      ).paddingOnly(right: 8),
                      AppTextRegular(
                        text: 'LEX IS HAPPY',
                        fontSize: 14,
                        color: appWhite,
                      ),
                    ],
                  ).paddingOnly(bottom: 4),

                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: appGreen, // The button color goes here
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: appLightBlack,
                  //         blurRadius: 0,
                  //         spreadRadius: 0,
                  //         offset: Offset(6, 6),
                  //       ),
                  //     ],
                  //   ),
                  //   child:
                  AppTextIcon(
                    onPressed: () {},
                    text: 'LESSON',
                    isColumn: true,
                    icon: appImageAsset(icCheck),
                    fontSize: 14,
                    backgroundColor: appGreen,
                    foregroundColor: appWhite,
                  ).paddingOnly(bottom: 10),

                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppElevatedButton(
                        onPressed: () => Get.toNamed(myCaseRoute),
                        color: appAqua,
                        text: 'START NEW CASE',
                        padding: 0,
                        textSize: 16,
                        borderColor: appDimBlack,
                        shadowColor: appBlack,
                        textColor: appWhite,
                      ).paddingOnly(bottom: 10),
                      AppElevatedButton(
                        onPressed: () => Get.toNamed(caseDetailRoute),
                        color: appPurple,
                        text: 'VIEW MY CASES',
                        borderColor: appDimBlack,
                        shadowColor: appBlack,
                        padding: 0,
                        textSize: 16,
                        textColor: appWhite,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppAchievementContainer(
                        onTap: () => Get.toNamed(settingRoute),
                        color: appAmber,
                        borderColor: appBlack,
                        isShadowAvailable: false,
                        child: Icon(Icons.settings).paddingAll(10),
                      ).paddingOnly(right: 60),
                      AppAchievementContainer(
                        onTap: () => Get.toNamed(profileRoute),
                        color: appAmber,
                        borderColor: appBlack,
                        isShadowAvailable: false,
                        child: Icon(Icons.person).paddingAll(10),
                      ),
                    ],
                  ).paddingAll(10).paddingOnly(top: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
