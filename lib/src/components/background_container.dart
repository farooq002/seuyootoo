import 'package:flutter/material.dart';
import 'package:souyoutoo/utils/colors_name.dart';

class AppAchievementContainer extends StatelessWidget {
  final Widget child;
  final width;
  final Color? color;
  final bool isBorderAvailable;
  final bool isShadowAvailable;
  final dynamic borderWidth;
  final EdgeInsetsGeometry? margin;
  final Color? shadowColor;
  final Color? borderColor;
  final void Function()? onTap;

  const AppAchievementContainer({
    super.key,
    required this.child,
    this.onTap,
    this.isBorderAvailable = true,
    this.width,
    this.margin,
    this.borderWidth,
    this.isShadowAvailable = true,
    this.color,
    this.shadowColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? appBlack,
          border: isBorderAvailable
              ? Border.all(
                  color: borderColor ?? appWhite,
                  width: borderWidth ?? 4.0,
                )
              : null,
          boxShadow: isShadowAvailable
              ? [
                  BoxShadow(
                    color: shadowColor ?? Colors.black,
                    offset: Offset(6, 0),
                  ),
                  BoxShadow(
                    color: shadowColor ?? Colors.black,
                    offset: Offset(0, 6),
                  ),
                  BoxShadow(
                    color: shadowColor ?? Colors.black,
                    offset: Offset(-6, 0),
                  ),
                  BoxShadow(
                    color: shadowColor ?? Colors.black,
                    offset: Offset(0, -6),
                  ),
                ]
              : null,
        ),
        child: child,
      ),
    );
  }
}
