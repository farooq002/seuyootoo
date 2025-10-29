import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/components/app_bar.dart';
import 'package:souyoutoo/components/app_button.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/components/app_text_icon.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class TabNewsView extends StatelessWidget {
  const TabNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(());
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: null,
        titleText: 'Progress & Evolution',
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

              decoration: BoxDecoration(
                color: appAmber,
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: appBlack,
                    offset: Offset(4, 4), // bottom-right
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: appBlack,
                    offset: Offset(-4, -4), // top-left
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: appBlack,
                    offset: Offset(4, -4), // top-right
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: appBlack,
                    offset: Offset(-4, 0), // bottom-left
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(icStreak, height: 40).paddingOnly(right: 8),
                      AppTextBold(
                        text: 'DAY 4 STREAK!',
                        fontSize: 20,
                        textAlign: TextAlign.center,
                        color: appBlack,
                      ),
                    ],
                  ),
                  AppTextBold(
                    text: 'Keep it up for a Case Analysis Reward',
                    fontSize: 18,
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
                      color: appBlack,
                      border: Border.all(color: appWhite, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(4, 4), // bottom-right
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(-4, -4), // top-left
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(4, -4), // top-right
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(-4, 4), // bottom-left
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        AppTextBold(
                          text: 'CURRENT LEVEL',
                          fontSize: 18,
                          textAlign: TextAlign.center,
                          color: appAmber,
                        ).paddingSymmetric(vertical: 10),
                        AppTextBold(
                          text: 'Junior Paralegal',
                          fontSize: 18,
                          textAlign: TextAlign.center,
                          color: appWhite,
                        ),
                        AppTextBold(
                          text: 'LEVEL 4',
                          fontSize: 18,
                          textAlign: TextAlign.center,
                          color: appGreen,
                        ).paddingSymmetric(vertical: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextBold(
                              text: '5 level PROGRESS',
                              fontSize: 16,
                              color: appWhite,
                            ),
                            AppTextRegular(
                              text: '2750/5000',
                              fontSize: 14,
                              color: appBlue,
                            ),
                          ],
                        ),
                        Container(
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final progressWidth =
                                  constraints.maxWidth * (2750 / 5000);
                              return Stack(
                                children: [
                                  Container(color: Colors.white),
                                  Container(
                                    width: progressWidth,
                                    color: appGreen,
                                  ),
                                ],
                              );
                            },
                          ),
                        ).paddingSymmetric(vertical: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: appBlue,
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                          child: Column(
                            children: [
                              AppTextBold(
                                text: 'WEEKLY LEARNING GOAL',
                                fontSize: 14,
                                color: appLightBlueGray,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppTextRegular(
                                    text: 'Cases Completed:',
                                    fontSize: 14,
                                    color: appWhite,
                                  ),
                                  AppTextRegular(
                                    text: '5/7',
                                    fontSize: 14,
                                    color: appGreen,
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 8),
                            ],
                          ),
                        ).paddingOnly(bottom: 10),
                      ],
                    ).paddingSymmetric(horizontal: 16),
                  ).paddingOnly(top: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: appBlue,
                      border: Border.all(color: appWhite, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(4, 4), // bottom-right
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(-4, -4), // top-left
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(4, -4), // top-right
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(-4, 4), // bottom-left
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        AppTextBold(
                          text: 'EARNED TOKENS',
                          fontSize: 18,
                          color: appLightBlueGray,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(icFrame),
                            AppTextRegular(
                              text: '47',
                              fontSize: 18,
                              color: appWhite,
                            ).paddingSymmetric(horizontal: 8),
                          ],
                        ),
                        AppTextBold(
                          text: 'Use on sueyoutoo.com',
                          fontSize: 18,
                          color: appLightBlueGray,
                        ),
                      ],
                    ),
                  ).paddingSymmetric(vertical: 20),
                  AppTextIcon(
                    text: 'View Active Cases',
                    onPressed: () {},
                    widthSize: MediaQuery.of(context).size.width * 0.9,
                    icon: Image.asset(tabCases, color: appWhite),
                    foregroundColor: appLightBlueGray,
                    backgroundColor: appGreen,
                    fontSize: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: appAmber,
                      border: Border.all(color: appWhite, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(4, 4), // bottom-right
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(-4, -4), // top-left
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(4, -4), // top-right
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: appWhite,
                          offset: Offset(-4, 4), // bottom-left
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: AppTextButton(
                      text: 'Retry Case',
                      fontSize: 20,
                      onPressed: () {},
                      color: appYellow,
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
