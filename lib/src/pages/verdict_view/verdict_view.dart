import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/model/home_models/case_by_id_model.dart';
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

class VerdictView extends BaseView<TrailController> {
  VerdictView({super.key});

  @override
  final controller = Get.find<TrailController>();
  @override
  Widget mBuild(BuildContext context) {
    final total = controller.caseDetail.value.questions?.length ?? 0;
    final correct =
        controller.caseDetail.value.questions
            ?.where((q) => q.type.value == QuestionType.correct)
            .length ??
        0;
    final percentage = total == 0 ? 0 : ((correct / total) * 100).round();
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
        titleText: 'BACK',
        customButton: AppElevatedButton(
          onPressed: () => Get.toNamed(newsRoute),
          text: 'Final Decision',
          textSize: 29,
          fontFamily: 'VT323',
          color: appBlack,
          borderColor: appBlack,
          shadowColor: appBlack,
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
                    color: appDarkYellow,
                    margin: const EdgeInsets.only(top: 16),
                    width: MediaQuery.of(context).size.width * 0.9,
                    borderColor: appDarkYellow,
                    child: Column(
                      children: [
                        AppTextRegular(
                          text: 'YOU WON THE CASE!',
                          fontSize: 40,
                          fontFamily: 'VT323',
                          textAlign: TextAlign.center,
                          color: Colors.black,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppAchievementContainer(
                    color: appAmber,
                    borderColor: appAmber,
                    shadowColor: appWhite,
                    child: AppTextRegular(
                      text: 'We nailed that verdict!',
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      fontFamily: 'PressStart2P',
                      color: appBlack,
                    ).paddingAll(10),
                  ).paddingOnly(top: 20),
                  AppAchievementContainer(
                    color: appBlack,
                    borderColor: appBlack,
                    shadowColor: appWhite,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextRegular(
                              text: 'Correct Answers:',
                              fontSize: 14,
                              fontFamily: 'PressStart2P',
                              color: appWhite,
                            ).paddingAll(10),
                            AppTextRegular(
                              text: '$correct/$total',
                              fontFamily: 'PressStart2P',
                              color: appGreen,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextRegular(
                              text: 'Accuracy:',
                              color: appWhite,
                              fontSize: 14,
                            ).paddingAll(10),
                            AppTextRegular(
                              text: '$percentage%',
                              fontSize: 14,
                              color: appGreen,
                            ).paddingAll(5),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextRegular(
                              text: 'XP Gained:',
                              fontSize: 14,
                              textAlign: TextAlign.center,
                              color: appWhite,
                            ).paddingAll(10),
                            AppTextRegular(
                              text:
                                  '${controller.caseDetail.value.rewardExp} XP',

                              fontSize: 14,
                              textAlign: TextAlign.center,
                              color: appBlue,
                            ).paddingAll(5),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextRegular(
                              text: 'Tokens\nEarned:',
                              fontSize: 14,
                              textAlign: TextAlign.start,
                              color: appWhite,
                            ).paddingAll(10),
                            AppTextRegular(
                              text:
                                  '+${controller.caseDetail.value.rewardTokens ?? 0}\nTOKENS',
                              fontSize: 14,
                              textAlign: TextAlign.end,
                              color: appAmber,
                            ).paddingAll(5),
                          ],
                        ),
                      ],
                    ),
                  ).paddingSymmetric(vertical: 30),
                  AppAchievementContainer(
                    color: appPurple,
                    borderColor: appPurple,
                    shadowColor: appWhite,
                    child: AppTextRegular(
                      text: 'New Briefcase Skin\nUnlocked!',
                      fontSize: 12,
                      fontFamily: 'PressStart2P',
                      textAlign: TextAlign.center,
                      color: appWhite,
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    color: appBlack,
                    borderColor: appBlack,
                    shadowColor: appWhite,
                    child: Column(
                      children: [
                        AppTextRegular(
                          text: 'Legal Learn Recap:',
                          fontSize: 12,
                          color: appWhite,
                        ),
                        AppTextRegular(
                          text: 'Q1: Overtime pay is ...',
                          fontSize: 12,
                          color: appWhite,
                        ),
                        AppTextRegular(
                          text: 'Correct! Based on Civil Code 2013.',
                          fontSize: 12,
                          color: appGreen,
                        ),
                        AppTextRegular(
                          text: 'Q2: A valid contract requires ...',
                          fontSize: 12,
                          color: appWhite,
                        ),
                        AppTextRegular(
                          text: 'Incorrect. It requires mutual consent.',
                          fontSize: 12,
                          color: appRed,
                        ),
                        AppTextButton(
                          text: 'Tap to Review Later',
                          onPressed: () {},
                          color: appAmber,
                          fontSize: 12,
                          decorationColor: appAmber,
                          isUnderline: true,
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 30),
                  AppElevatedButton(
                    text: 'Review Lessons',
                    onPressed: () => Get.toNamed(newsRoute),
                    textColor: appLightBlueGray,
                    color: appBlue,
                    borderColor: appDimGray,
                    shadowColor: appBlack,
                    textSize: 16,
                  ),
                  AppElevatedButton(
                    text: 'Retry Case',
                    textSize: 16,
                    onPressed: () => Get.toNamed(newCaseRoute),
                    color: appAmber,
                    borderColor: appWhite,
                    shadowColor: appBlack,
                    textColor: appYellow,
                  ).paddingOnly(top: 20),
                ],
              ).paddingSymmetric(horizontal: 42).paddingOnly(bottom: 42),
            ),
          ],
        ),
      ),
    );
  }
}
