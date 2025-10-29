import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/components/app_bar.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/components/app_text_icon.dart';
import 'package:souyoutoo/module/tabs/case_question_tab/case_question_view_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class CaseQuestionView extends StatelessWidget {
  const CaseQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CaseQuestionViewController());

    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: null,
        titleText: 'Case #023',
        customButton: AppTextIcon(
          text: '1:42',
          icon: Image.asset(icClock, height: 18),
          onPressed: () {},
          fontSize: 18,
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
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: const [
                  BoxShadow(color: Colors.black, offset: Offset(4, 4)),
                ],
              ),
              child: Column(
                children: [
                  AppTextBold(
                    text: 'The People vs. Unpaid Overtime',
                    fontSize: 16,
                    color: Colors.black,
                  ).paddingOnly(bottom: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => AppTextSemiBold(
                          text:
                              "QUESTION ${controller.currentQuestionIndex.value + 1}/${controller.questions.length}",
                          fontSize: 12,
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
                                width: 14,
                                height: 14,
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
              ),
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
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: const [
                    BoxShadow(color: Colors.black, offset: Offset(4, 4)),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextBold(
                        text: question.question,
                        fontSize: 16,
                        color: Colors.black,
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
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Employee worked 45 hours in one week, including 5 hours of mandatory training after regular shift.",
                                style: const TextStyle(
                                  color: Colors.black,
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
                            () => Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                color: controller.optionColors[index],
                                border: Border.all(color: appBlack, width: 2),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$optionLabel: ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppTextRegular(
                                      text: question.options[index],
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
