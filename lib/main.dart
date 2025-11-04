import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:souyoutoo/module/base/base_controller.dart';
import 'package:souyoutoo/routes/app_routes.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/utils/colors_name.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BaseController());
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      title: 'SEUYOUTOO',
      initialRoute: splashRoute,
      getPages: appRoutes,
    );
  }
}
