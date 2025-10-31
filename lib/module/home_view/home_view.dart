import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/routes/navigation/tabs/cases_nav_view.dart';
import 'package:souyoutoo/routes/navigation/tabs/home_nav_view.dart';
import 'package:souyoutoo/routes/navigation/tabs/news_nav_view.dart';
import 'package:souyoutoo/routes/navigation/tabs/stats_nav_view.dart';
import 'package:souyoutoo/routes/navigation/tabs/trial_nav_view.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';
import 'home_view_controller.dart';

class HomeView extends StatelessWidget {
  final List<Widget> _screens = const [
    HomeNavView(),
    TrialNavView(),
    CasesNavView(),
    StatsNavView(),
    NewsNavView(),
  ];

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeViewController());
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Obx(() {
          return Center(child: _screens[controller.currentIndex.value]);
        }),
        backgroundColor: appBrown,
        bottomNavigationBar: Obx(
          () => Row(
            children: List.generate(5, (index) {
              final isSelected = controller.currentIndex.value == index;
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
                  onTap: () => controller.changeTabIndex(index),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: isSelected ? appAmber : appYellow,
                      border: Border.all(color: appBlack, width: 2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
