import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';

class CasesNavView extends StatelessWidget {
  const CasesNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(Destination.cases.route),
      initialRoute: Destination.cases.route,
      onGenerateRoute: (category) => Destination.getPage(category),
    );
  }
}
