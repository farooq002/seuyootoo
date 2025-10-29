import 'package:flutter/material.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';
import 'app_text.dart';

AppBar appBar(
  BuildContext context, {
  String? titleText = "Settings",
  Widget? rightText,
  bool centerTitle = false,
  String? leftIconSvg = icBack,
  double leadingWidth = 36.0,

  double leftIconPadding = 14.0,
  List<Widget>? customActions,
  VoidCallback? onLeftIconPress,
  Widget? customButton,
}) {
  return AppBar(
    backgroundColor: appBlack,
    leadingWidth: leftIconSvg != null ? leadingWidth : null,
    leading: leftIconSvg != null
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: leftIconPadding / 2),
            child: GestureDetector(
              onTap: onLeftIconPress,
              child: Image.asset(
                leftIconSvg,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          )
        : null,
    title: AppTextBold(
      text: titleText ?? "Settings",
      fontSize: 22,
      color: appWhite,
    ),
    centerTitle: centerTitle,

    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20 / 2),
        child: customButton,
      ),
    ],
  );
}
