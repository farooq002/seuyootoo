import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';

class NewsNavView extends StatelessWidget {
  const NewsNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(Destination.news.value),
      initialRoute: Destination.news.route,
      onGenerateRoute: (home) => Destination.getPage(home),
      // pages: appRoutes,
    );
  }
}
