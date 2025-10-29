import 'package:flutter/material.dart';
import 'package:get/get.dart';

BottomNavigationBarItem appBottomNavigationBarItem(
  String imageName,
  String label,
  int index,
  int currentIndex,
) {
  return BottomNavigationBarItem(
    icon: Stack(
      clipBehavior: Clip.none,
      children: [
        if (currentIndex == index)
          Positioned(
            top: -5,
            left: 0,
            right: 0,
            child: Container(
              width: 10,
              height: 2,
              decoration: ShapeDecoration(
                color: Theme.of(Get.context!).secondaryHeaderColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(1),
                    bottomRight: Radius.circular(1),
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
    label: label,
  );
}
