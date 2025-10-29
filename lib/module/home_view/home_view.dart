import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/components/custom_bottom_nav_bar.dart';
import 'package:souyoutoo/routes/navigation/tabs/cases_nav_view.dart';
import 'package:souyoutoo/routes/navigation/tabs/home_nav_view.dart';
import 'package:souyoutoo/routes/navigation/tabs/news_nav_view.dart';
import 'package:souyoutoo/routes/navigation/tabs/stats_nav_view.dart';
import 'package:souyoutoo/routes/navigation/tabs/trial_nav_view.dart';
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
    return Scaffold(
      body: Obx(() {
        return Center(child: _screens[controller.currentIndex.value]);
      }),
      bottomNavigationBar: Obx(() {
        return CustomBottomNavBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTabIndex,
        );
      }),
    );
  }
}
