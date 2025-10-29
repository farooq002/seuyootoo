import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'app_name'.tr,
      initialRoute: '/',
      getPages: appRoutes,
    );
  }
}
