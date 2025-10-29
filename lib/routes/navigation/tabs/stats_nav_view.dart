import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';

class StatsNavView extends StatelessWidget {
  const StatsNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(Destination.stats.value),
      initialRoute: Destination.stats.route,
      onGenerateRoute: (setting) => Destination.getPage(setting),
    );
  }
}
