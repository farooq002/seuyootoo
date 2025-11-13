import 'package:flutter/material.dart';

class AppTextRegular extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? height;
  final Color? color;
  final int? lineLimit;
  final bool overflow;
  const AppTextRegular({
    super.key,
    required this.text,
    this.fontSize,
    this.height,
    this.textAlign,
    this.overflow = false,
    this.lineLimit = 4,
    this.color,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: lineLimit!,
      overflow: overflow ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      softWrap: true,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        height: height,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily ?? 'PressStart2P',
        color: color,
      ),
    );
  }
}

class AppTextThin extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final Color? color;
  final int? lineLimit;
  final String? fontFamily;
  final bool? isUnderline;
  final Color? decorationColor;
  const AppTextThin({
    super.key,
    required this.text,
    this.isUnderline = false,
    this.fontFamily,
    this.fontSize,
    this.decorationColor,
    this.textAlign,
    this.lineLimit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //// maxLines: lineLimit!,
      textAlign: textAlign,

      style: TextStyle(
        fontSize: fontSize ?? 18,
        fontWeight: FontWeight.w300,
        decoration: isUnderline!
            ? TextDecoration.underline
            : TextDecoration.none,
        decorationColor: decorationColor,
        decorationThickness: 1,
        fontFamily: fontFamily ?? 'PressStart2P',
        color: color,
      ),
    );
  }
}
