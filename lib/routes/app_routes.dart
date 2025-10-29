import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/module/home_view/home_view.dart';
import 'package:souyoutoo/module/tabs/case_question_tab/case_question_view.dart';
import 'package:souyoutoo/module/tabs/tab_home_view/tab_home_view.dart';
import 'package:souyoutoo/module/tabs/tab_news_view/tab_news_view.dart';
import 'package:souyoutoo/module/tabs/tab_stats/tab_stats_view.dart';
import 'package:souyoutoo/module/tabs/trial_tab/tab_trial_view.dart';
import 'package:souyoutoo/routes/navigation/main_nav_view.dart';

final appRoutes = [
  GetPage(
    name: '/',
    page: () {
      return const MainNavView();
    },
  ),
];

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}

enum Destination {
  main,
  //MARK: - Tabbar Navigation
  home,
  trial,
  cases,
  stats,
  news;

  String get route {
    return name == Destination.main ? '/' : 'tab$name';
  }

  Widget get widget {
    switch (this) {
      case Destination.main:
        return const HomeView(); //token != '' ? const HomeView() : const ImmediatorView();
      case Destination.home:
        return const TabHomeView();
      case Destination.trial:
        return const TabTrialView();
      case Destination.cases:
        return const CaseQuestionView();
      case Destination.stats:
        return const TabStatsView();
      case Destination.news:
        return const TabNewsView();
    }
  }

  static GetPageRoute getPage(RouteSettings settings) {
    var destination = Destination.values.firstWhereOrNull(
      (e) => e.route == settings.name,
    );
    return GetPageRoute(page: () => destination?.widget ?? Container());
  }
}

extension DestinationExtension on Destination {
  int get value {
    switch (this) {
      case Destination.main:
        return 0;
      case Destination.home:
        return 1;
      case Destination.trial:
        return 2;
      case Destination.cases:
        return 3;
      case Destination.stats:
        return 4;
      case Destination.news:
        return 5;
    }
  }
}
