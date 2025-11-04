import 'dart:ui';

class Categories {
  final String name;
  final String? price;
  final bool? isIconAvailable;
  final String? icon;
  final String? description;
  final Color? color;
  final Color? backgroundColor;
  final Color? textColor;

  Categories({
    required this.name,
    this.price,
    this.isIconAvailable = false,
    this.icon,
    this.backgroundColor,
    this.color,
    this.description,
    this.textColor,
  });
}
