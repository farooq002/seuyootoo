import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/controller/home/home_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class MyCaseView extends BaseView<HomeController> {
  MyCaseView({super.key});

  @override
  final controller = Get.put(HomeController());

  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
        titleText: 'BACK',
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            bottom: 100,
            child: Image.asset(icBackground, fit: BoxFit.fill),
          ),
          Positioned(
            top: MediaQuery.of(Get.context!).size.height / 7.5,
            left: 0,
            right: 0,
            child: appImageAsset(icJudge, height: 250),
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
            bottom: 10,
            left: 0,
            right: 0,

            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  AppTextRegular(
                    text: 'My Cases',
                    color: appWhite,
                    fontFamily: 'VT323',
                    fontSize: 22,
                  ),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount:
                            controller.myCaseData.value.progress?.length ?? 0,
                        itemBuilder: (context, index) {
                          final caseData =
                              controller.myCaseData.value.progress?[index];
                          return AppAchievementContainer(
                            color: appWhite,
                            borderColor: appWhite,
                            isShadowAvailable: true,
                            child: Column(
                              children: [
                                AppTextRegular(
                                  text: 'CASE #${caseData?.id ?? 0}',
                                  fontSize: 24,
                                  textAlign: TextAlign.center,
                                  fontFamily: 'VT323',
                                  color: appBlue,
                                ),
                                AppTextRegular(
                                  text: caseData?.title ?? '',
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
                                  text: caseData?.description ?? '',
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
                                            caseData?.difficulty ?? 0;
                                        return Image.asset(
                                          index < difficulty
                                              ? icStar
                                              : icStarBlack,
                                          width: 18,
                                          height: 18,
                                        ).paddingOnly(right: 4);
                                      }),
                                    ),
                                  ],
                                ).paddingSymmetric(vertical: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppTextRegular(
                                      text: 'QUESTIONS:',
                                      fontSize: 18,
                                      fontFamily: 'VT323',
                                    ),
                                    AppTextRegular(
                                      text:
                                          '${caseData?.questionsCount ?? 0} Questions (~3 MINS)',
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
                                          text: '+${caseData?.rewardExp} XP',
                                          fontFamily: 'VT323',
                                          fontSize: 18,
                                          color: appGreen,
                                        ),
                                        Image.asset(
                                          icFrame,
                                          width: 18,
                                          height: 18,
                                        ).paddingOnly(left: 4),
                                      ],
                                    )
                                    .paddingSymmetric(vertical: 10)
                                    .paddingOnly(right: 30),
                              ],
                            ).paddingAll(10),
                          ).paddingAll(10);
                        },
                      ),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 32),
            ),
          ),
        ],
      ),
    );
  }
}
