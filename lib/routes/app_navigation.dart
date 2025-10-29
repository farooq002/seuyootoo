import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/routes/app_routes.dart';
import 'package:souyoutoo/utils/colors_name.dart';

var route = '';
Future<T?>? push<T>(
  Widget page, {
  id = 0,
  Transition transition = Transition.native,
  Duration duration = const Duration(milliseconds: 300),
}) {
  route = page.toString();
  return Get.to(() => page, id: id, transition: transition, duration: duration);
}

Future<T?>? removeAllAndSet<T>(
  Widget page, {
  Transition transition = Transition.native,
  Duration duration = const Duration(milliseconds: 300),
  id = 0,
}) {
  if (route == page.toString()) {
    return null;
  }
  route = page.toString();
  return Get.offAll(
    () => page,
    transition: transition,
    duration: duration,
    id: id,
  );
}

Future<T?>? replace<T>(
  Widget page, {
  Transition transition = Transition.native,
  Duration duration = const Duration(milliseconds: 300),
  preventDuplicates = true,
  id = 0,
}) {
  route = page.toString();
  return Get.off(
    () => page,
    transition: transition,
    duration: duration,
    id: id,
  );
}

void back<T>({id = 0}) {
  Get.back(id: id);
}

void dismissPopUp<T>() {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    Get.back();
  });
}

openDialog(Widget page, {bool barrierDismissible = true}) {
  if (route == page.toString()) {
    return null;
  }
  route = page.toString();
  SchedulerBinding.instance.addPostFrameCallback((_) {
    Get.dialog(
      page,
      barrierDismissible: barrierDismissible,
      barrierColor: appBlack.withOpacity(0.5),
    );
  });
}

popToRoot(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
  route = '';
}

void popAllRoot({Destination navKey = Destination.main}) {
  Get.nestedKey(navKey.value)?.currentState?.popUntil((route) => route.isFirst);
}
