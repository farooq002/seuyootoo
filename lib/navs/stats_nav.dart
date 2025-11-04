
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/constants/nav_ids.dart';
import 'package:souyoutoo/module/pages/question_view/question_view.dart';
import 'package:souyoutoo/module/pages/stats/stats_view.dart';
import 'package:souyoutoo/navs/question_nav.dart';
import 'package:souyoutoo/routes/routes_name.dart';


class StatsNav extends StatelessWidget {
  const StatsNav({super.key});

  @override
  Widget build(BuildContext context) {
    return  Navigator(
      key: Get.nestedKey(NavIds.stats),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case questionRoute:
             return GetPageRoute(
            settings: settings,
            page: () => const QuestionView(),
          );
          default:
           return GetPageRoute(
            settings: settings,
            page: () => const StatsView(),
          );
        }
      },
    );
  }
}