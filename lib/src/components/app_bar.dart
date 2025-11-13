import 'package:flutter/material.dart';
import 'package:souyoutoo/src/components/app_image.dart';
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
              child: appImageAsset(leftIconSvg, height: 26, color: appWhite),
            ),
          )
        : null,
    title: AppTextRegular(
      text: titleText ?? "Settings",
      fontSize: 29,
      color: appWhite,
      fontFamily: 'VT323',
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
