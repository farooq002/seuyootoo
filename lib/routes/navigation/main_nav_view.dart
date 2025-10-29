import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/routes/app_routes.dart';

class MainNavView extends StatelessWidget {
  const MainNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(0),
      initialRoute: Destination.main.route,
      onGenerateRoute: (main) => Destination.getPage(main),
    );
  }
}
