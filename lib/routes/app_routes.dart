import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:souyoutoo/module/base/base_view.dart';
import 'package:souyoutoo/module/pages/login_view/login_view.dart';
import 'package:souyoutoo/module/pages/map_view/map_view.dart';
import 'package:souyoutoo/module/pages/profile_view/profile_view.dart';
import 'package:souyoutoo/module/pages/question_view/question_view.dart';
import 'package:souyoutoo/module/pages/shop_view/shop_view.dart';
import 'package:souyoutoo/module/pages/sign_up_view/sign_up_view.dart';
import 'package:souyoutoo/module/pages/splash_screen/splash_view.dart';
import 'package:souyoutoo/module/pages/trial_view/trial_view.dart';
import 'package:souyoutoo/module/pages/verdict_view/verdict_view.dart';
import 'package:souyoutoo/routes/routes_name.dart';

final appRoutes = [
  GetPage(name: splashRoute, page: () => const SplashView()),
  GetPage(name: loginRoute, page: () => const LoginView()),
  GetPage(name: signUpRoute, page: () => const SignUpView()),
  GetPage(
    name: homeRoute,
    page: () => const MainTabView(),
    middlewares: [AuthMiddleWare()],
  ),
  GetPage(name: shopRoute, page: () => const ShopView()),
  GetPage(name: verdictRoute, page: () => const VerdictView()),
  GetPage(name: mapRoute, page: () => const MapView()),
  GetPage(name: trailRoute, page: () => const TrialView()),
  GetPage(name: profileRoute, page: () => const ProfileView()),

  GetPage(name: '$trailRoute$questionRoute', page: () => const QuestionView()),
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
