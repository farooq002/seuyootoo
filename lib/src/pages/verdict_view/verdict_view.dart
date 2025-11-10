import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/model/home_models/case_by_id_model.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
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
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: appDarkYellow,
                border: Border.all(color: Colors.black, width: 2),
                // boxShadow: const [
                //   BoxShadow(
                //     color: appBlack,
                //     offset: Offset(4, 4), // bottom-right
                //     blurRadius: 4,
                //   ),
                //   BoxShadow(
                //     color: appBlack,
                //     offset: Offset(-4, -4), // top-left
                //     blurRadius: 4,
                //   ),
                //   BoxShadow(
                //     color: appBlack,
                //     offset: Offset(4, -4), // top-right
                //     blurRadius: 4,
                //   ),
                //   BoxShadow(
                //     color: appBlack,
                //     offset: Offset(-4, 0), // bottom-left
                //     blurRadius: 4,
                //   ),
                // ],
              ),
              child: Column(
                children: [
                  AppTextRegular(
                    text: 'YOU WON THE CASE!',
                    fontSize: 46,
                    fontFamily: 'VT323',
                    textAlign: TextAlign.center,
                    color: Colors.black,
                  ),
                ],
              ),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: appAmber,
                      border: Border.all(color: appWhite, width: 2),
                    ),
                    child: AppTextBold(
                      text: 'We nailed that verdict!',
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      fontFamily: 'PressStart2P',
                      color: appBlack,
                    ).paddingAll(10),
                  ).paddingOnly(top: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: appBlack,
                      border: Border.all(color: appBlack, width: 2),
                    ),
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
                        ).paddingSymmetric(horizontal: 10),
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
                        ).paddingSymmetric(horizontal: 10),
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
                        ).paddingSymmetric(horizontal: 10),
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
                              text: '+2\nTOKENS',
                              fontSize: 14,
                              textAlign: TextAlign.end,
                              color: appAmber,
                            ).paddingAll(5),
                          ],
                        ).paddingSymmetric(horizontal: 10),
                      ],
                    ),
                  ).paddingSymmetric(vertical: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: appPurple,
                      border: Border.all(color: appWhite, width: 2),
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: appWhite,
                      //     offset: Offset(4, 4), // bottom-right
                      //     blurRadius: 4,
                      //   ),
                      //   BoxShadow(
                      //     color: appWhite,
                      //     offset: Offset(-4, -4), // top-left
                      //     blurRadius: 4,
                      //   ),
                      //   BoxShadow(
                      //     color: appWhite,
                      //     offset: Offset(4, -4), // top-right
                      //     blurRadius: 4,
                      //   ),
                      //   BoxShadow(
                      //     color: appWhite,
                      //     offset: Offset(-4, 4), // bottom-left
                      //     blurRadius: 4,
                      //   ),
                      // ],
                    ),
                    child: AppTextBold(
                      text: 'New Briefcase Skin\nUnlocked!',
                      fontSize: 12,
                      fontFamily: 'PressStart2P',
                      textAlign: TextAlign.center,
                      color: appWhite,
                    ).paddingAll(10),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: appBlack,
                      border: Border.all(color: appWhite, width: 2),
                    ),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: appBlue,
                      border: Border.all(color: appWhite, width: 2),
                    ),
                    child: AppElevatedButton(
                      text: 'Review Lessons',
                      onPressed: () {},
                      textColor: appLightBlueGray,
                      color: appBlue,
                      textSize: 16,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: appAmber,
                      border: Border.all(color: appWhite, width: 2),
                    ),
                    child: AppElevatedButton(
                      text: 'Retry Case',
                      textSize: 16,
                      onPressed: () {},
                      color: appAmber,
                      textColor: appYellow,
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
