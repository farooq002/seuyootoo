import 'package:flutter/material.dart';

Widget appImageAsset(
  String path, {
  double? width,
  double? height,
  Color? color,
  BoxFit fit = BoxFit.contain,
}) {
  return Image.asset(
    path,
    width: width,
    height: height,
    color: color,
    fit: fit,
  );
}
