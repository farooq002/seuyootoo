import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/pages/case_detail/case_detail_view.dart';
import 'package:souyoutoo/src/pages/case_updates/case_updates.dart';
import 'package:souyoutoo/src/pages/edit_profile/edit_profile_view.dart';
import 'package:souyoutoo/src/pages/my_case_view/my_case_view.dart';
import 'package:souyoutoo/src/pages/new_case_start/new_case_view.dart';
import 'package:souyoutoo/src/pages/news_view/news_view.dart';
import 'package:souyoutoo/src/pages/ticket_view/create_ticket_view.dart';
import 'package:souyoutoo/src/tab_view/main_tab_view.dart';
import 'package:souyoutoo/src/pages/login_view/login_view.dart';
import 'package:souyoutoo/src/pages/map_view/map_view.dart';
import 'package:souyoutoo/src/pages/profile_view/profile_view.dart';
import 'package:souyoutoo/src/pages/question_view/question_view.dart';
import 'package:souyoutoo/src/pages/shop_view/shop_view.dart';
import 'package:souyoutoo/src/pages/sign_up_view/sign_up_view.dart';
import 'package:souyoutoo/src/pages/splash_screen/splash_view.dart';
import 'package:souyoutoo/src/pages/stats/stats_view.dart';
import 'package:souyoutoo/src/pages/trial_view/trial_view.dart';
import 'package:souyoutoo/src/pages/verdict_view/verdict_view.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/utils/local_storage/storage_service.dart';

final appRoutes = [
  GetPage(name: splashRoute, page: () => const SplashView()),
  GetPage(name: loginRoute, page: () => LoginView()),
  GetPage(name: signUpRoute, page: () => const SignUpView()),
  GetPage(
    name: homeRoute,
    page: () => MainTabView(),
    middlewares: [AuthMiddleWare()],
  ),
  GetPage(name: shopRoute, page: () => const ShopView()),
  GetPage(name: newCaseRoute, page: () => NewCaseView()),
  GetPage(name: caseUpdateRoute, page: () => CaseUpdatesView()),
  GetPage(name: myCaseRoute, page: () => MyCaseView()),
  GetPage(name: caseDetailRoute, page: () => CaseDetailView()),
  GetPage(name: verdictRoute, page: () => VerdictView()),
  GetPage(name: mapRoute, page: () => const MapView()),
  GetPage(name: trailRoute, page: () => TrialView()),
  GetPage(name: profileRoute, page: () => ProfileView()),
  GetPage(name: editProfileRoute, page: () => EditProfileView()),
  GetPage(name: questionRoute, page: () => QuestionView()),
  GetPage(name: statsRoute, page: () => const StatsView()),
  GetPage(name: newsRoute, page: () => NewsView()),
  GetPage(name: createTicketRoute, page: () => CreateTicketView()),
];

class AuthMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    bool isLoggedIn = StorageService.instance.getToken()?.isNotEmpty ?? false;

    if (!isLoggedIn && route != loginRoute) {
      return const RouteSettings(name: loginRoute);
    }

    if (isLoggedIn && route == loginRoute) {
      return const RouteSettings(name: homeRoute);
    }

    return null;
  }
}
