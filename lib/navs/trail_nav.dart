import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/constants/nav_ids.dart';
import 'package:souyoutoo/module/pages/trial_view/trial_view.dart';
import 'package:souyoutoo/routes/routes_name.dart';

class TrailNav extends StatelessWidget {
  const TrailNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.trail),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case homeRoute:
             return GetPageRoute(
            settings: settings,
            page: () => const TrialView(),
          );
          default:
           return GetPageRoute(
            settings: settings,
            page: () => const TrialView(),
          );
        }
      },
    );
  }
}
