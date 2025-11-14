import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/controller/trail/trail_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class TrialView extends BaseView<TrailController> {
  TrialView({super.key});

  @override
  final controller = Get.put(TrailController());
  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
        titleText: 'BACK',
        customButton: AppTextButton(
          text: 'NEW CASE',
          fontSize: 24,
          color: appWhite,
          fontFamily: 'VT323',
          onPressed: () async {
            final caseId = controller.caseData.value.cases?.first.id;
            final isOk = await controller.takeCase(caseId);
            if (isOk == true) {
              controller.getCaseById(caseId);
            }
          },
        ),
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
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: appDarkYellow,
                    borderColor: appDarkYellow,
                    isShadowAvailable: true,
                    child: Column(
                      children: [
                        AppTextRegular(
                          text:
                              '"Here\'s your new case, Counselor! Ready to defend?"',
                          fontSize: 20,
                          fontFamily: 'VT323',
                          textAlign: TextAlign.center,
                          color: appBlack,
                        ),
                      ],
                    ),
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
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    color: appWhite,
                    borderColor: appWhite,
                    child: Obx(
                      () => Column(
                        children: [
                          AppTextRegular(
                            text:
                                'CASE #${controller.caseData.value.cases?.first.id}',
                            fontSize: 24,
                            textAlign: TextAlign.center,
                            fontFamily: 'VT323',
                            color: appBlue,
                          ),
                          AppTextRegular(
                            text:
                                controller.caseData.value.cases?.first.title ??
                                '',
                            fontFamily: 'VT323',
                            fontSize: 30,

                            textAlign: TextAlign.center,
                            color: appBlack,
                          ),
                          DottedLine(
                            dashLength: 2,
                            dashGapLength: 2,
                            lineThickness: 4,
                            dashColor: appBlack,
                            direction: Axis.horizontal,
                          ),
                          AppTextRegular(
                            text:
                                controller
                                    .caseData
                                    .value
                                    .cases
                                    ?.first
                                    .description ??
                                '',
                            // 'A group of employees claim they were forced to work off-the-clock. Your job is to argue their case and secure their rightful compensation.',
                            fontSize: 18,
                            fontFamily: 'VT323',
                          ).paddingSymmetric(vertical: 20),
                          Row(
                            children: [
                              AppTextRegular(
                                text: 'DIFFICULTY:',
                                fontSize: 18,
                                fontFamily: 'VT323',
                              ),
                              const Spacer(),
                              AppTextRegular(
                                text: 'MEDIUM',
                                color: appAmber,
                                fontFamily: 'VT323',
                                fontSize: 24,
                              ).paddingOnly(right: 4),
                              Row(
                                children: List.generate(3, (index) {
                                  final difficulty =
                                      controller
                                          .caseData
                                          .value
                                          .cases
                                          ?.first
                                          .difficulty ??
                                      0;
                                  return appImageAsset(
                                    index < difficulty ? icStar : icStarBlack,
                                    width: 18,
                                    height: 18,
                                  ).paddingOnly(right: 4);
                                }),
                              ),
                            ],
                          ).paddingSymmetric(vertical: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTextRegular(
                                text: 'QUESTIONS:',
                                fontSize: 18,
                                fontFamily: 'VT323',
                              ),
                              AppTextRegular(
                                text:
                                    '${controller.caseData.value.cases?.first.questionsCount} Questions (~3 MINS)',
                                fontFamily: 'VT323',
                                fontSize: 18,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AppTextRegular(
                                text: 'REWARDS:',
                                fontSize: 18,
                                fontFamily: 'VT323',
                              ),
                              const Spacer(),
                              AppTextRegular(
                                text:
                                    '+${controller.caseData.value.cases?.first.rewardExp} XP',
                                fontFamily: 'VT323',
                                fontSize: 18,
                                color: appGreen,
                              ),
                              appImageAsset(
                                icFrame,
                                width: 18,
                                height: 18,
                              ).paddingOnly(left: 4),
                            ],
                          ).paddingSymmetric(vertical: 10).paddingOnly(right: 30),
                        ],
                      ),
                    ),
                  ).paddingAll(30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
