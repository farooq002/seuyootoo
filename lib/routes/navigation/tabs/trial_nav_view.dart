import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';

class TrialNavView extends StatelessWidget {
  const TrialNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(Destination.trial.value),
      initialRoute: Destination.trial.route,
      onGenerateRoute: (history) => Destination.getPage(history),
      // pages: appRoutes,
    );
  }
}
