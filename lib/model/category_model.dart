class Categories {
  final String name;
  final String? price;
  final bool? isIconAvailable;
  final String? icon;

  Categories({
    required this.name,
    required this.price,
    this.isIconAvailable = false,
    this.icon,
  });
}
