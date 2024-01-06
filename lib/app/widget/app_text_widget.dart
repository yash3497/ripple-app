import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? height;
  final TextDecoration? textDecoration;

  AppTextWidget({
    required this.text,
    this.textStyle = const TextStyle(),
    this.textAlign = TextAlign.left,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.height,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    final customTextStyle = textStyle.copyWith(
        color: textColor ?? textStyle.color,
        fontSize: fontSize ?? textStyle.fontSize,
        fontWeight: fontWeight ?? textStyle.fontWeight,
        fontStyle: fontStyle ?? textStyle.fontStyle,
        decoration: textDecoration ?? textStyle.decoration,
        height: height ?? textStyle.height,
        fontFamily: "Urbanist");

    return Text(
      text,
      style: customTextStyle,
      textAlign: textAlign,
    );
  }
}
