import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:souyoutoo/components/app_bar.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/module/tabs/trial_tab/tab_trial_view_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class TabTrialView extends StatelessWidget {
  const TabTrialView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabTrialViewController());
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: null,
        titleText: 'Trial',
        customButton: AppTextBold(
          text: 'New Case',
          fontSize: 16,
          color: appWhite,
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
                color: appAmber,
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: const [
                  BoxShadow(color: Colors.black, offset: Offset(4, 4)),
                ],
              ),
              child: Column(
                children: [
                  AppTextBold(
                    text:
                        '"Here\'s your new case, Counselor! Ready to defend?"',
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: appWhite,
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: const [
                  BoxShadow(color: Colors.black, offset: Offset(4, 4)),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppTextRegular(
                      text: 'CASE #023',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: appBlue,
                    ),
                    AppTextBold(
                      text: 'The People vs. Unpaid Overtime',
                      fontSize: 22,
                      textAlign: TextAlign.center,
                      color: appBlack,
                    ).paddingSymmetric(vertical: 8),
                    DottedLine(
                      dashLength: 2,
                      dashGapLength: 2,
                      lineThickness: 4,
                      dashColor: appBlack,
                      direction: Axis.horizontal,
                    ),
                    AppTextSemiBold(
                      text:
                          'A group of employees claim they were forced to work off-the-clock. Your job is to argue their case and secure their rightful compensation.',
                      fontSize: 14,
                    ).paddingSymmetric(vertical: 8),
                    Row(
                      children: [
                        AppTextRegular(text: 'DIFFICULTY:'),
                        const Spacer(),
                        AppTextRegular(text: 'MEDIUM', color: appAmber),
                        Image.asset(
                          icStar,
                          width: 16,
                          height: 16,
                        ).paddingSymmetric(horizontal: 4),
                        Image.asset(icStar, width: 16, height: 16),
                        Image.asset(
                          icStarBlack,
                          width: 16,
                          height: 16,
                        ).paddingSymmetric(horizontal: 4),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextRegular(text: 'QUESTIONS:'),
                        AppTextRegular(
                          text: '5 Questions (~3 MINS)',
                          fontSize: 14,
                        ),
                      ],
                    ).paddingSymmetric(vertical: 8),
                    Row(
                      children: [
                        AppTextRegular(text: 'REWARDS:'),
                        const Spacer(),
                        AppTextRegular(
                          text: '+150 XP',
                          fontSize: 14,
                          color: appGreen,
                        ),
                        Image.asset(
                          icFrame,
                          width: 16,
                          height: 16,
                        ).paddingOnly(left: 4),
                      ],
                    ).paddingSymmetric(vertical: 8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
