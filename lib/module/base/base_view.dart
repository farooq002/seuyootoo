import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/module/base/base_controller.dart';
import 'package:souyoutoo/navs/home_nav.dart';
import 'package:souyoutoo/navs/news_nav.dart';
import 'package:souyoutoo/navs/question_nav.dart';
import 'package:souyoutoo/navs/stats_nav.dart';
import 'package:souyoutoo/navs/trail_nav.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: appBrown,
        body: Obx(
          () => IndexedStack(
            index: BaseController.to.currentIndex.value,
            children: const [
              HomeNav(),
              TrailNav(),
              QuestionNav(),
              StatsNav(),
              NewsNav(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => Row(
            children: List.generate(5, (index) {
              final isSelected = BaseController.to.currentIndex.value == index;
              final labels = [
                'HOME'.tr,
                'TRIAL'.tr,
                'CASES'.tr,
                'STATS'.tr,
                'NEWS'.tr,
              ];
              final icons = [tabHome, tabTrial, tabCases, tabStats, tabNews];
              return Expanded(
                child: GestureDetector(
                  onTap: () => BaseController.to.changePage(index),
                  child: Container(
                    height: 76,
                    decoration: BoxDecoration(
                      color: isSelected ? appAmber : appYellow,
                      border: Border.all(color: appBlack, width: 2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          icons[index],
                          width: 24,
                          height: 24,
                          color: isSelected ? appBlack : appGray,
                        ),
                        AppTextBold(
                          text: labels[index],
                          fontSize: 12,
                          color: isSelected ? appBlack : appGray,
                        ),
                      ],
                    ).paddingOnly(top: 8),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
