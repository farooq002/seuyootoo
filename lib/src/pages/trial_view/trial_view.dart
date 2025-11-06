import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/controller/home_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class TrialView extends StatelessWidget {
  const TrialView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
        titleText: 'BACK',
        customButton: Obx(() {
          final caseId = controller.caseData.value.cases?.first.id;

          return AppTextButton(
            text: 'New Case',
            fontSize: 29,
            color: appWhite,
            fontFamily: 'VT323',
            onPressed: caseId == null
                ? () {}
                : () {
                    Get.toNamed(questionRoute, arguments: {'caseId': caseId});
                  },
          );
        }),
      ),
      body: TrailViewComponent(),
    );
  }
}

class TrailViewComponent extends StatelessWidget {
  const TrailViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Stack(
      children: [
        Positioned.fill(
          top: 0,
          bottom: 100,
          child: Image.asset(icBackground, fit: BoxFit.fill),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: 0.7,
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
              border: Border.all(color: Colors.black, width: 4),
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
              //     offset: Offset(-4, 4), // bottom-left
              //     blurRadius: 4,
              //   ),
              // ],
            ),
            child: Column(
              children: [
                AppTextThin(
                  text: '"Here\'s your new case, Counselor! Ready to defend?"',
                  fontSize: 20,
                  fontFamily: 'VT323',
                  textAlign: TextAlign.center,
                  color: appBlack,
                ),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 25,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: appWhite,
              border: Border.all(color: Colors.black, width: 2),
              // boxShadow: const [
              //   BoxShadow(color: Colors.black, offset: Offset(4, 4)),
              // ],
            ),
            child: SingleChildScrollView(
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
                      text: controller.caseData.value.cases?.first.title ?? '',
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
                    AppTextThin(
                      text:
                          controller.caseData.value.cases?.first.description ??
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
                            return Image.asset(
                              index < difficulty ? icStar : icStarBlack,
                              width: 12,
                              height: 12,
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
                              '${controller.caseData.value.cases?.first.questionsCount}',
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
                              '${controller.caseData.value.cases?.first.rewardExp} XP',
                          fontFamily: 'VT323',
                          fontSize: 18,
                          color: appGreen,
                        ),
                        Image.asset(
                          icFrame,
                          width: 12,
                          height: 12,
                        ).paddingOnly(left: 4),
                      ],
                    ).paddingSymmetric(vertical: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
