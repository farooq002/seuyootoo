import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/export.dart';

import 'package:souyoutoo/components/app_button.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/components/app_text_icon.dart';
import 'package:souyoutoo/module/tabs/trial_tab/tab_trial_view.dart';
import 'package:souyoutoo/routes/app_navigation.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

import 'tab_home_view_controller.dart';

class TabHomeView extends StatelessWidget {
  const TabHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabHomeViewController());

    return Scaffold(
      appBar: AppBar(
        title: AppTextBold(text: 'SUEYOUTOO', fontSize: 12, color: appWhite),
        centerTitle: false,
        backgroundColor: appBlack,
        actions: [
          AppTextIcon(
            icon: Image.asset(icStreak),
            onPressed: () {},
            text: '7 DAY STREAK',
            fontSize: 14,
            foregroundColor: appWhite,
            backgroundColor: appBlack,
          ),
        ],
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextBold(
                        text: '5 level PROGRESS',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      AppTextRegular(
                        text: '2750/5000',
                        fontSize: 10,
                        color: Colors.blue[700]!,
                      ),
                    ],
                  ).paddingOnly(bottom: 6),

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
                              color: Colors.blue[400],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: controller.size.height * 0.01,
            left: controller.size.width * 0.05,
            right: controller.size.width * 0.05,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: appAmber,
                    border: Border.all(color: appWhite, width: 2),
                  ),
                  child: AppTextRegular(
                    text: '"Ready for today\'s case?"',
                    fontSize: 14,
                    textAlign: TextAlign.center,
                    color: appWhite,
                  ).paddingAll(10),
                ).paddingOnly(bottom: controller.size.height * 0.01),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: appGreen,
                        border: Border.all(color: appWhite, width: 2),
                      ),
                      height: 25,
                      width: 25,
                    ).paddingOnly(right: 8),
                    AppTextRegular(
                      text: 'LEX IS HAPPY',
                      fontSize: 14,
                      color: appWhite,
                    ),
                  ],
                ).paddingOnly(bottom: 4),

                AppTextIcon(
                  onPressed: () {},
                  text: 'LESSON',
                  isColumn: true,
                  icon: Image.asset(icCheck),
                  fontSize: 14,
                  // padding: 10,
                  backgroundColor: appGreen,
                  foregroundColor: appWhite,
                ).paddingOnly(bottom: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppElevatedButton(
                      onPressed: () => push(TabTrialView()),
                      color: appAqua,
                      text: 'START NEW CASE',
                      padding: 0,
                      textSize: 16,
                      textColor: appWhite,
                    ).paddingOnly(bottom: 6),
                    AppElevatedButton(
                      onPressed: () {},
                      color: appPurple,
                      text: 'VIEW MY CASES',
                      padding: 0,
                      textSize: 16,
                      textColor: appWhite,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
