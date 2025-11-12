import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'app_text.dart';

class AppTextIcon extends StatelessWidget {
  final Widget? icon;
  final String text;
  final String? fontFamily;
  final void Function() onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final double? offSetX;
  final double? offSetY;
  final bool isColumn;
  final double? fontSize;
  final double? borderWidth;
  final double? widthSize;
  final double? textScaleFactor;
  final bool iconAtEnd;

  const AppTextIcon({
    super.key,
    required this.onPressed,
    this.text = 'Edit Profile',
    this.isColumn = false,
    this.icon,
    this.foregroundColor,
    this.offSetX,
    this.offSetY,
    this.borderColor,
    this.backgroundColor,
    this.shadowColor,
    this.fontSize = 12,
    this.borderWidth = 2,
    this.textScaleFactor,
    this.widthSize,
    this.iconAtEnd = false,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    final content = isColumn
        ? Column(
            children: [
              if (icon != null) ...[const SizedBox(width: 6), icon!],
              AppTextRegular(
                text: text,
                // textScaleFactor: textScaleFactor,
                fontSize: fontSize,
                fontFamily: fontFamily,
              ).paddingOnly(right: 10),
            ],
          )
        : iconAtEnd
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextRegular(
                text: text,
                // textScaleFactor: textScaleFactor,
                fontSize: fontSize,
                fontFamily: fontFamily,
              ).paddingOnly(right: 10),
              if (icon != null) ...[const SizedBox(width: 6), icon!],
            ],
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                const SizedBox(width: 6),
                icon!.paddingOnly(right: 10),
              ],
              AppTextRegular(
                text: text,
                // textScaleFactor: textScaleFactor,
                fontSize: fontSize,
                fontFamily: fontFamily,
              ),
            ],
          );

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).secondaryHeaderColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? appDimBlack,
            offset: Offset(offSetX ?? 6, offSetY ?? 6),
          ),
        ],
        border: Border.all(
          width: borderWidth ?? 2,
          color: borderColor ?? appDarkBrown,
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor ?? Theme.of(context).primaryColor,
          minimumSize: Size(widthSize ?? 30, 0),
          animationDuration: const Duration(milliseconds: 300),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          padding: EdgeInsets.all(8),
        ),
        onPressed: onPressed,
        child: content,
      ),
    );
  }
}
