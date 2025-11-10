import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/model/home_models/case_by_id_model.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_icon.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/controller/trail/trail_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class QuestionView extends BaseView<TrailController> {
  @override
  final controller = Get.isRegistered<TrailController>()
      ? Get.find<TrailController>()
      : Get.put(TrailController());
  QuestionView({super.key});

  @override
  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
        titleText: 'Case #023',
        customButton: Obx(
          () => AppTextIcon(
            text: controller.formatTime(controller.currentTime.value),
            icon: Image.asset(icClock, height: 26),
            onPressed: () {},
            fontSize: 30,
            fontFamily: 'VT323',
            backgroundColor: appBlack,
            foregroundColor: appWhite,
            iconAtEnd: true,
          ),
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
            child: AppAchievementContainer(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: appWhite,
              borderColor: appWhite,
              isShadowAvailable: true,
              shadowColor: appBlack,
              child: Column(
                children: [
                  Obx(
                    () => AppTextBold(
                      text: controller.caseDetail.value.title ?? '',
                      fontSize: 18,
                      fontFamily: 'VT323',
                      color: Colors.black,
                    ).paddingOnly(bottom: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => AppTextSemiBold(
                          text:
                              "QUESTION ${controller.currentQuestIndex.value + 1}/${controller.caseDetail.value.questions?.length ?? 0}",
                          fontSize: 14,
                          fontFamily: 'VT323',
                        ),
                      ),
                      SizedBox(
                        height: 16,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              controller.caseDetail.value.questions?.length ??
                              0,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => Container(
                                width: 16,
                                height: 16,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      controller
                                              .caseDetail
                                              .value
                                              .questions?[index]
                                              .type
                                              .value ==
                                          QuestionType.correct
                                      ? Colors.green
                                      : controller
                                                .caseDetail
                                                .value
                                                .questions?[index]
                                                .type
                                                .value ==
                                            QuestionType.wrong
                                      ? Colors.red
                                      : Colors.grey,
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
            ).paddingAll(30),
          ),

          Obx(() {
            final question = controller
                .caseDetail
                .value
                .questions?[controller.currentQuestIndex.value];
            return Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              bottom: 25,
              left: 0,
              right: 0,
              child: AppAchievementContainer(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: appWhite,
                shadowColor: appBlack,
                borderColor: appWhite,
                isShadowAvailable: true,
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
                        text: question?.questionText ?? '',
                        fontSize: 18,
                        color: appBlack,
                        fontFamily: 'VT323',
                      ),
                      question?.evidence == null || question?.evidence == ''
                          ? SizedBox.shrink()
                          : Container(
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
                                      text: question?.evidence,
                                      // "Employee worked 45 hours in one week, including 5 hours of mandatory training after regular shift.",
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
                      ...List.generate(question?.choices?.length ?? 0, (index) {
                        final optionLabel = String.fromCharCode(65 + index);

                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => controller.goToNextQuest(index),
                            child: Obx(
                              () => AppAchievementContainer(
                                width: double.infinity,
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                color: controller.optionColor(
                                  controller.currentQuestIndex.value,
                                  index,
                                ),
                                borderColor: appBlack,
                                isBorderAvailable: true,
                                isShadowAvailable: false,
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
                                        text: question?.choices?[index],
                                        fontSize: 16,
                                        color: appBlack,
                                        fontFamily: 'VT323',
                                      ),
                                    ),
                                  ],
                                ).paddingAll(10),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ).paddingAll(10),
              ).paddingSymmetric(horizontal: 32),
            );
          }),
        ],
      ),
    );
  }
}
