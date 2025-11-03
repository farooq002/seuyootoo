import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:souyoutoo/module/main_tab_view/main_tab_view.dart';
import 'package:souyoutoo/module/views/login_view/login_view.dart';
import 'package:souyoutoo/module/views/map_view/map_view.dart';
import 'package:souyoutoo/module/views/profile_view/profile_view.dart';
import 'package:souyoutoo/module/views/question_view/question_view.dart';
import 'package:souyoutoo/module/views/shop_view/shop_view.dart';
import 'package:souyoutoo/module/views/trial_view/trial_view.dart';
import 'package:souyoutoo/module/views/verdict_view/verdict_view.dart';
import 'package:souyoutoo/routes/routes_name.dart';

final appRoutes = [
  GetPage(name: loginRoute, page: () => const LoginView()),
  GetPage(
    name: homeRoute,
    page: () => const MainTabView(),
    middlewares: [AuthMiddleWare()],
  ),
  // GetPage(
  //   name: questionRoute,
  //   page: () => const QuestionView(),
  //   middlewares: [AuthMiddleWare()],
  // ),
  GetPage(
    name: shopRoute,
    page: () => const ShopView(),
    middlewares: [AuthMiddleWare()],
  ),
  GetPage(
    name: verdictRoute,
    page: () => const VerdictView(),
    middlewares: [AuthMiddleWare()],
  ),
  GetPage(
    name: mapRoute,
    page: () => const MapView(),
    middlewares: [AuthMiddleWare()],
  ),
  GetPage(
    name: trailRoute,
    page: () => const TrialView(),
    middlewares: [AuthMiddleWare()],
    children: [
      GetPage(
        name: '$trailRoute$questionRoute',
        page: () => const QuestionView(),
      ),
    ],
  ),
  GetPage(
    name: profileRoute,
    page: () => const ProfileView(),
    middlewares: [AuthMiddleWare()],
  ),
];

class AuthMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    bool isLoggedIn = box.read('isLoggedIn') ?? false;

    if (!isLoggedIn && route != loginRoute) {
      return const RouteSettings(name: loginRoute);
    }

    if (isLoggedIn && route == loginRoute) {
      return const RouteSettings(name: homeRoute);
    }

    return null;
  }
}
