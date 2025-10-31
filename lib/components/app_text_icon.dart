import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'app_text.dart';

class AppTextIcon extends StatelessWidget {
  final Widget? icon;
  final String text;
  final String? fontFamily;
  final void Function() onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final bool isColumn;
  final double? fontSize;
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
    this.backgroundColor,
    this.fontSize = 12,
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
              AppTextBold(
                text: text,
                textScaleFactor: textScaleFactor,
                fontSize: fontSize,
                fontFamily: fontFamily,
              ).paddingOnly(right: 10),
            ],
          )
        : iconAtEnd
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextBold(
                text: text,
                textScaleFactor: textScaleFactor,
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
              AppTextBold(
                text: text,
                textScaleFactor: textScaleFactor,
                fontSize: fontSize,
                fontFamily: fontFamily,
              ),
            ],
          );

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor ?? Theme.of(context).primaryColor,
        backgroundColor:
            backgroundColor ?? Theme.of(context).secondaryHeaderColor,
        minimumSize: Size(widthSize ?? 30, 0),
        animationDuration: const Duration(milliseconds: 300),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: onPressed,
      child: content,
    );
  }
}
