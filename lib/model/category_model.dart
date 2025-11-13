import 'package:flutter/material.dart';

class Categories {
  final String name;
  final String? price;
  final bool? isIconAvailable;
  final String? icon;
  final String? description;
  final Color? color;
  final Color? backgroundColor;
  final Color? textColor;
  final Icon? icons;

  Categories({
    required this.name,
    this.price,
    this.isIconAvailable = false,
    this.icon,
    this.backgroundColor,
    this.color,
    this.description,
    this.textColor,
    this.icons,
  });
}
