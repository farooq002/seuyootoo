import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/module/home_view/main_tab_view.dart';
import 'package:souyoutoo/module/tabs/map_view/map_view.dart';
import 'package:souyoutoo/module/tabs/profile_view/profile_view.dart';
import 'package:souyoutoo/module/tabs/question_view/question_view.dart';
import 'package:souyoutoo/module/shop_view/shop_view.dart';
import 'package:souyoutoo/module/tabs/trial_view/trial_view.dart';
import 'package:souyoutoo/module/tabs/verdict_view/verdict_view.dart';
import 'package:souyoutoo/routes/routes_name.dart';

final appRoutes = [
  GetPage(
    name: homeRoute,
    page: () {
      return const MainTabView();
    },
  ),
   GetPage(
    name: questionRoute,
    page: () {
      return const QuestionView();
    },
  ),
   GetPage(
    name: shopRoute,
    page: () {
      return const ShopView();
    },
  ),
  GetPage(
    name: verdictRoute,
    page: () {
      return const VerdictView();
    },
  ),
   GetPage(
    name: mapRoute,
    page: () {
      return const MapView();
    },
  ),
    GetPage(
    name: trailRoute,
    page: () {
      return const TrialView();
    },
  ),
    GetPage(
    name: profileRoute,
    page: () {
      return const ProfileView();
    },
  ),
];

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}