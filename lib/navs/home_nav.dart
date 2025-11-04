import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/constants/nav_ids.dart';
import 'package:souyoutoo/module/pages/home_view/home_view.dart';
import 'package:souyoutoo/routes/routes_name.dart';


class HomeNav extends StatelessWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.home),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case homeRoute:
             return GetPageRoute(
            settings: settings,
            page: () => const HomeView(),
          );
          default:
           return GetPageRoute(
            settings: settings,
            page: () => const HomeView(),
          );
        }
      },
    );
  }
}
