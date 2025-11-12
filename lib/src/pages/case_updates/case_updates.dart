import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_progress_bar.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/controller/home/home_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class CaseUpdatesView extends BaseView<HomeController> {
  CaseUpdatesView({super.key});
  @override
  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        titleText: 'CASE #2024-001',
        centerTitle: false,
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
              borderColor: appYellow,
              color: appYellow,
              shadowColor: appAmber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appImageAsset(icCaseCat).paddingOnly(right: 10),
                  Expanded(
                    child: AppTextRegular(
                      text: 'Murder Case Defense',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ).paddingSymmetric(horizontal: 42),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            bottom: 10,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppAchievementContainer(
                    color: appYellow,
                    borderColor: appYellow,
                    shadowColor: appAmber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            appImageAsset(icScroll),
                            Expanded(
                              child: AppTextRegular(
                                text: 'Current Task Progress',
                                fontSize: 16,
                              ),
                            ),
                            appImageAsset(icHammerColored),
                          ],
                        ),
                        AppTextRegular(text: 'Task Objectives', fontSize: 12),
                        Center(
                          child: AppTextRegular(
                            text: 'Understanding the Charge',
                            fontSize: 10,
                          ),
                        ),
                        AppAchievementContainer(
                          isShadowAvailable: false,
                          color: appLightYellow,
                          borderColor: appAmber,
                          child: Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: controller.check.value,
                                  onChanged: (value) {
                                    controller.check.value = value ?? false;
                                  },
                                ),
                              ),
                              Expanded(
                                child: AppTextRegular(
                                  text:
                                      'Read and understand the details of the murder charge against you',
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ).paddingOnly(bottom: 10),
                        AppAchievementContainer(
                          isShadowAvailable: false,
                          color: appLightYellow,
                          borderColor: appAmber,
                          child: Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: controller.check.value,
                                  onChanged: (value) {
                                    controller.check.value = value ?? false;
                                  },
                                ),
                              ),
                              Expanded(
                                child: AppTextRegular(
                                  text:
                                      'Take note of specific allegations and evidence presented by the prosecution',
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: AppTextRegular(
                            text: 'Gathering Evidence',
                            fontSize: 10,
                          ),
                        ),
                        AppAchievementContainer(
                          isShadowAvailable: false,
                          color: appLightYellow,
                          borderColor: appAmber,
                          child: Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: controller.check.value,
                                  onChanged: (value) {
                                    controller.check.value = value ?? false;
                                  },
                                ),
                              ),
                              Expanded(
                                child: AppTextRegular(
                                  text:
                                      'Compile a list of all potential witnesses who can provide an alibi',
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    color: appAmber,
                    borderColor: appAmber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            appImageAsset(icFolder).paddingOnly(right: 10),
                            Expanded(
                              child: AppTextRegular(
                                text: 'Case Details',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        AppTextRegular(
                          text:
                              'The case involves a murder charge where the defendant is accused of committing a homicide. It will focus on proving or disproving the defendant\'s involvement in the alleged crime.',
                          fontSize: 10,
                        ).paddingSymmetric(vertical: 10),
                        Center(
                          child: AppTextRegular(
                            text: 'November 6, 2025',
                            fontSize: 12,
                          ),
                        ),
                        AppElevatedButton(
                          text: 'CLOSE GATE',
                          onPressed: () {},
                          color: appRed,
                          offSetX: -6,
                          offSetY: -6,
                        ).paddingOnly(top: 20),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 20),
                  AppAchievementContainer(
                    color: appAmber,
                    borderColor: appAmber,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.balance).paddingOnly(right: 10),
                            AppTextRegular(text: 'Case Progress', fontSize: 14),
                          ],
                        ).paddingOnly(bottom: 10),
                        Row(
                          children: [
                            appImageAsset(
                              tabTrial,
                              color: appBlack,
                            ).paddingOnly(right: 10),
                            Expanded(
                              child: AchievementProgressBar(
                                currentValue: 25.0,
                                totalValue: 100.0,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: AppTextRegular(text: '33.33%', fontSize: 12),
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    color: appAmber,
                    borderColor: appAmber,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            appImageAsset(icRobot).paddingOnly(right: 10),
                            AppTextRegular(text: 'AI Analysis', fontSize: 14),
                          ],
                        ).paddingOnly(bottom: 10),
                        AppTextRegular(
                          text:
                              'AI is reviewing evidence for inconsistencies. Analysis pending...',
                          fontSize: 10,
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 20),
                ],
              ).paddingAll(42),
            ),
          ),
        ],
      ),
    );
  }
}
