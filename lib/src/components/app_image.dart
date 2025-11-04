import 'package:flutter/material.dart';

Widget appImageAsset(
  String imagePath, {
  double? height,
  double? width,
  Color? color,
  BoxFit fit = BoxFit.contain,
}) {
  return Image.asset(
    imagePath,
    height: height,
    width: width,
    color: color,
    fit: fit,
  );
}
