import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';

class HomeNavView extends StatelessWidget {
  const HomeNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(Destination.home.value),
      initialRoute: Destination.home.route,
      onGenerateRoute: (home) => Destination.getPage(home),
      // pages: appRoutes,
    );
  }
}
