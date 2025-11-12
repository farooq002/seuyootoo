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
        customButton: AppTextBold(
          text: 'Final Decision',
          fontSize: 29,
          fontFamily: 'VT323',
          color: appLightGray,
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
            top: 20,
            left: 0,
            right: 0,
            child: AppAchievementContainer(
              color: appDarkYellow,
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
                    color: appAmber,
                    borderColor: appAmber,
                    shadowColor: appWhite,
                    child: AppTextBold(
                      text: 'We nailed that verdict!',
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      fontFamily: 'PressStart2P',
                      color: appBlack,
                    ).paddingAll(10),
                  ).paddingOnly(top: 10),
                  AppAchievementContainer(
                    color: appBlack,
                    borderColor: appBlack,
                    shadowColor: appWhite,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextBold(
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
                            AppTextBold(
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
                            AppTextBold(
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
                            AppTextBold(
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
                  ).paddingSymmetric(vertical: 20),
                  AppAchievementContainer(
                    color: appPurple,
                    borderColor: appPurple,
                    shadowColor: appWhite,
                    child: AppTextBold(
                      text: 'New Briefcase Skin\nUnlocked!',
                      fontSize: 12,
                      fontFamily: 'PressStart2P',
                      textAlign: TextAlign.center,
                      color: appWhite,
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    width: MediaQuery.of(context).size.width * 0.9,

                    color: appBlack,
                    borderColor: appBlack,
                    shadowColor: appWhite,
                    child: Column(
                      children: [
                        AppTextBold(
                          text: 'Legal Learn Recap:',
                          fontSize: 12,
                          color: appWhite,
                        ),
                        AppTextBold(
                          text: 'Q1: Overtime pay is ...',
                          fontSize: 12,
                          color: appWhite,
                        ),
                        AppTextBold(
                          text: 'Correct! Based on Civil Code 2013.',
                          fontSize: 12,
                          color: appGreen,
                        ),
                        AppTextBold(
                          text: 'Q2: A valid contract requires ...',
                          fontSize: 12,
                          color: appWhite,
                        ),
                        AppTextBold(
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
                  ).paddingSymmetric(vertical: 20),
                  AppElevatedButton(
                    text: 'Review Lessons',
                    onPressed: () => Get.toNamed(createTicketRoute),
                    textColor: appLightBlueGray,
                    color: appBlue,
                    borderColor: appDimGray,
                    shadowColor: appBlack,
                    textSize: 16,
                  ),
                  AppElevatedButton(
                    text: 'Retry Case',
                    textSize: 16,
                    onPressed: () {},
                    color: appAmber,
                    borderColor: appWhite,
                    shadowColor: appBlack,
                    textColor: appYellow,
                  ).paddingOnly(top: 20),
                ],
              ).paddingAll(42),
            ),
          ),
        ],
      ),
    );
  }
}
