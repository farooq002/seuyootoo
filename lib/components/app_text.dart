import 'package:flutter/material.dart';
// import '../enums.dart';

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
        decorationThickness: 2,
        fontFamily: fontFamily ?? 'PressStart2P',
        color: color,
      ),
    );
  }
}

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

class AppTextMedium extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final String? fontFamily;
  final Color? color;
  final int? lineLimit;
  const AppTextMedium({
    super.key,
    required this.text,
    this.fontSize,
    this.fontFamily,
    this.textAlign,
    this.lineLimit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      ////// maxLines: lineLimit!,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily ?? 'PressStart2P',
        color: color,
      ),
    );
  }
}

class AppTextSemiBold extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final Color? color;
  final int? lineLimit;
  final String? fontFamily;
  final bool overflow;
  const AppTextSemiBold({
    super.key,
    required this.text,
    this.fontSize,
    this.textAlign,
    this.fontFamily,
    this.lineLimit = 4,
    this.overflow = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // maxLines: lineLimit!,
      overflow: overflow ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 18,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily ?? 'PressStart2P',
        color: color,
      ),
    );
  }
}

class AppTextBold extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final Color? color;
  final String? fontFamily;
  final int? lineLimit;
  final TextDecoration? textDecoration;
  final bool overflow;
  const AppTextBold({
    super.key,
    required this.text,
    this.textScaleFactor,
    this.fontFamily,
    this.fontSize,
    this.overflow = false,
    this.textAlign,
    this.lineLimit = 4,
    this.color,
    this.textDecoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: lineLimit!,
      overflow: overflow ? TextOverflow.ellipsis : null,
      textScaleFactor: textScaleFactor,
      style: TextStyle(
        decoration: textDecoration,
        fontSize: fontSize ?? 30,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily ?? 'PressStart2P',
        color: color,
      ),
    );
  }
}

class AppTextItalic extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final String? fontFamily;
  final Color? color;
  final int? lineLimit;
  const AppTextItalic({
    super.key,
    required this.text,
    this.fontSize,
    this.fontFamily,
    this.textAlign,
    this.color,
    this.lineLimit,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      ////// maxLines: lineLimit!,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 18,
        fontStyle: FontStyle.italic,
        fontFamily: fontFamily ?? 'PressStart2P',
        color: color,
      ),
    );
  }
}
