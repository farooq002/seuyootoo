import 'package:flutter/material.dart';
import 'package:souyoutoo/utils/colors_name.dart';

class AppAchievementContainer extends StatelessWidget {
  final Widget child;
  final width;
  final Color? color;
  final bool isBorderAvailable;
  final bool isShadowAvailblle;
  final dynamic borderWidth;
  final EdgeInsetsGeometry? margin;
  final Color? shadowColor;
  final Color? borderColor;

  const AppAchievementContainer({
    super.key,
    required this.child,
    this.isBorderAvailable = true,
    this.width,
    this.margin,
    this.borderWidth,
    this.isShadowAvailblle = true,
    this.color,
    this.shadowColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        boxShadow: isShadowAvailblle
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
    );
  }
}
