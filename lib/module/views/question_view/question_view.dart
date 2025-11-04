import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/components/app_bar.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/components/app_text_icon.dart';
import 'package:souyoutoo/components/background_container.dart';
import 'package:souyoutoo/module/views/question_view/question_view_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionViewController());

    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
        titleText: 'Case #023',
        customButton: AppTextIcon(
          text: '1:42',
          icon: Image.asset(icClock, height: 26),
          onPressed: () {},
          fontSize: 30,
          fontFamily: 'VT323',
          backgroundColor: appBlack,
          foregroundColor: appWhite,
          iconAtEnd: true,
        ),
      ),
      body: Stack(
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
              heightFactor: 0.65,
              child: Image.asset(icForeground, fit: BoxFit.fill),
            ),
          ),

          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: AppAchievementContainer(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: appWhite,
              borderColor: appBlack,
              shadowColor: appBlack,
              child: Column(
                children: [
                  AppTextBold(
                    text: 'The People vs. Unpaid Overtime',
                    fontSize: 18,
                    fontFamily: 'VT323',
                    color: Colors.black,
                  ).paddingOnly(bottom: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => AppTextSemiBold(
                          text:
                              "QUESTION ${controller.currentQuestionIndex.value + 1}/${controller.questions.length}",
                          fontSize: 14,
                          fontFamily: 'VT323',
                        ),
                      ),
                      SizedBox(
                        height: 14,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.questions.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => Container(
                                width: 12,
                                height: 12,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: controller.getProgressColor(index),

                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingAll(10),
            ),
          ),

          Obx(() {
            final question =
                controller.questions[controller.currentQuestionIndex.value];
            return Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              bottom: 10,
              left: 0,
              right: 0,
              child: AppAchievementContainer(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: Colors.white,
                shadowColor: appBlack,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppTextRegular(
                        text: 'LEGAL QUESTION',
                        fontSize: 16,
                        color: appBlue,
                        fontFamily: 'VT323',
                      ),
                      AppTextRegular(
                        text: question.question,
                        fontSize: 18,
                        color: appBlack,
                        fontFamily: 'VT323',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: appYellow,
                          border: const Border(
                            left: BorderSide(color: appAmber, width: 6),
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "EVIDENCE: ",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: appBlack,
                                  fontFamily: 'VT323',
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Employee worked 45 hours in one week, including 5 hours of mandatory training after regular shift.",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: appBlack,
                                  fontFamily: 'VT323',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ).paddingAll(10),
                      ).paddingSymmetric(vertical: 10),
                      ...List.generate(question.options.length, (index) {
                        final optionLabel = String.fromCharCode(65 + index);

                        return GestureDetector(
                          onTap: () => controller.selectAnswer(index),
                          child: Obx(
                            () => AppAchievementContainer(
                              width: double.infinity,

                              margin: const EdgeInsets.symmetric(vertical: 6),
                              // decoration: BoxDecoration(
                              color: controller.optionColors[index],
                              // border: Border.all(color: appBlack, width: 2),
                              // ),
                              borderColor: appBlack,
                              isBorderAvailable: true,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextRegular(
                                    text: "$optionLabel: ",
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'VT323',
                                  ),
                                  Expanded(
                                    child: AppTextRegular(
                                      text: question.options[index],
                                      fontSize: 16,
                                      color: appBlack,
                                      fontFamily: 'VT323',
                                    ),
                                  ),
                                ],
                              ).paddingAll(10),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ).paddingAll(10),
              ),
            );
          }),
        ],
      ),
    );
  }
}
