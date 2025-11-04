import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/constants/nav_ids.dart';
import 'package:souyoutoo/module/pages/news_view/news_view.dart';
import 'package:souyoutoo/routes/routes_name.dart';
class NewsNav extends StatelessWidget {
  const NewsNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.news),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case trailRoute:
             return GetPageRoute(
            settings: settings,
            page: () => const NewsView(),
          );
          default:
           return GetPageRoute(
            settings: settings,
            page: () => const NewsView(),
          );
        }
      },
    );
  }
}