import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_progress_bar.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_icon.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

import 'home_view_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                border: Border.all(color: Colors.black, width: 4),
                // boxShadow: const [
                //   BoxShadow(color: Colors.black, offset: Offset(4, 4)),
                // ],
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

                  AchievementProgressBar(currentValue: 3500, totalValue: 5000),
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

                // Container(
                //   decoration: BoxDecoration(
                //     boxShadow: [
                //       BoxShadow(color: appLightBlack, offset: Offset(0, -2)),
                //     ],
                //   ),
                //   child: AppTextIcon(
                //     onPressed: () {},
                //     text: 'LESSON',
                //     isColumn: true,
                //     icon: Image.asset(icCheck),
                //     fontSize: 14,
                //     // padding: 10,
                //     backgroundColor: appGreen,
                //     foregroundColor: appWhite,
                //   ).paddingOnly(bottom: 8),
                // ),
                Container(
                  decoration: BoxDecoration(
                    color: appGreen, // The button color goes here
                    boxShadow: [
                      BoxShadow(
                        color: appLightBlack,
                        blurRadius: 0,
                        spreadRadius: 0,
                        offset: Offset(6, 6),
                      ),
                    ],
                  ),
                  child: AppTextIcon(
                    onPressed: () {},
                    text: 'LESSON',
                    isColumn: true,
                    icon: Image.asset(icCheck),
                    fontSize: 14,
                    backgroundColor: Colors.transparent,
                    foregroundColor: appWhite,
                  ),
                ).paddingOnly(bottom: 10),

                // NEW, CORRECT CODE:
                Container(
                  // 1. Outer Container: Provides the SHADOW COLOR
                  color: appLightBlack, // Your solid block shadow color
                  // 2. Padding: Defines the SHADOW THICKNESS on all 4 sides
                  // This padding creates the border space *inside* the black container.
                  padding: EdgeInsets.all(6.0),

                  // 3. Child: Your Button Content (AppTextIcon)
                  child: AppTextIcon(
                    onPressed: () {},
                    text: 'LESSON',
                    isColumn: true,
                    // CRITICAL: Ensure filterQuality is set here if possible,
                    // or inside AppTextIcon if it manages the image.
                    icon: Image.asset(
                      icCheck,
                      filterQuality: FilterQuality.none,
                    ),
                    fontSize: 14,
                    // AppTextIcon's color is the actual button color (appGreen)
                    backgroundColor: appGreen,
                    foregroundColor: appWhite,
                  ),
                ).paddingOnly(
                  bottom: 10,
                ), // The external GetX padding for spacing

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppElevatedButton(
                      onPressed: () => Get.toNamed(trailRoute),
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
