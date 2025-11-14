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
      backgroundColor: appBrown,
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
                            currentValue:
                                controller.profileData.value.exp ?? 0.0,
                            totalValue:
                                controller.profileData.value.expToNextLevel ??
                                1.0,
                          ),
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingOnly(top: 20, left: 42, right: 42),
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
                  ).paddingSymmetric(horizontal: 24),
                  SizedBox(height: 20),
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
                  ),
                  SizedBox(height: 20),
                  AppTextIcon(
                    height: 85,
                    onPressed: () {},
                    text: 'LESSON',
                    isColumn: true,
                    icon: appImageAsset(icCheck),
                    fontSize: 14,
                    backgroundColor: appGreen,
                    foregroundColor: appWhite,
                  ),
                  SizedBox(height: 20),
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
                      ),
                      SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextIcon(
                        height: 50,
                        width: 65,
                        onPressed: () => Get.toNamed(settingRoute),
                        backgroundColor: appAmber,
                        borderColor: appBlack,
                        icon: Icon(Icons.settings, size: 32, color: appBlack),
                        isJustIcon: true,
                        offSetX: 3,
                        offSetY: 3,
                        shadowColor: appBlack,
                      ),
                      SizedBox(width: 60),
                      AppTextIcon(
                        height: 50,
                        width: 65,
                        onPressed: () => Get.toNamed(profileRoute),
                        backgroundColor: appAmber,
                        borderColor: appBlack,
                        icon: Icon(Icons.person, size: 32, color: appBlack),
                        isJustIcon: true,
                        offSetX: 3,
                        offSetY: 3,
                        shadowColor: appBlack,
                      ),
                    ],
                  ),
                ],
              ).paddingAll(24),
            ).paddingOnly(right: 2),
          ],
        ),
      ),
    );
  }
}
