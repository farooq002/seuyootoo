


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/constants/nav_ids.dart';
import 'package:souyoutoo/module/pages/question_view/question_view.dart';
import 'package:souyoutoo/routes/routes_name.dart';

class QuestionNav extends StatelessWidget {
  const QuestionNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.question),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case trailRoute:
             return GetPageRoute(
            settings: settings,
            page: () => const QuestionView(),
          );
          default:
           return GetPageRoute(
            settings: settings,
            page: () => const QuestionView(),
          );
        }
      },
    );
  }
}