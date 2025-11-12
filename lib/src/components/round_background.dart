// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:souyoutoo/utils/colors_name.dart';

class BackgroundBox extends StatelessWidget {
  final Color? backGroundColor;
  final void Function() onTap;
  final double boxOpacity;
  final double? boxHeight;
  final double boxWidth;
  final double radius;
  final Widget? data;
  final double innerPadding;

  const BackgroundBox({
    Key? key,
    this.backGroundColor,
    this.boxOpacity = 0.4,
    this.boxHeight,
    this.boxWidth = 0,
    this.radius = 22,
    this.innerPadding = 0,
    this.data,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(innerPadding),
        margin: const EdgeInsets.all(2),
        constraints: BoxConstraints(
          minHeight: 50,
          maxHeight: boxHeight ?? double.infinity,
        ),
        width: boxWidth == 0 ? null : boxWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: backGroundColor ?? appWhite,
          // boxShadow: [
          //   BoxShadow(
          //     color: appLightBlack,
          //     spreadRadius: 0.1,
          //     blurRadius: 0.1,
          //   ),
          // ],
          border: Border.all(color: appBlack, width: 2),
        ),
        child: data,
      ),
    );
  }
}
