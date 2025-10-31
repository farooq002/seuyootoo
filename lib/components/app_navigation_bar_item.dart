import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/utils/colors_name.dart';

BottomNavigationBarItem appBottomNavigationBarItem(
  String imageName,
  String label,
  int index,
  int currentIndex,
) {
  final isSelected = currentIndex == index;

  return BottomNavigationBarItem(
    label: label,
    icon: Container(
      decoration: BoxDecoration(
        color: isSelected ? appAmber : appYellow,
        border: Border.all(color: appBlack),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Image.asset(
        imageName,
        width: 24,
        height: 24,
        color: isSelected ? appBlack : appGray,
      ),
    ),
  );
}
