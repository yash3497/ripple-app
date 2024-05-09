import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';

import '../../utils/constant_variable.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color bgColor;
  final Color txtcolor;
  final Color borderColor;
  final double? btnwidth;
  final double? btnHeight;
  final double borderRadius;

  AppButton(
      {required this.onPressed,
      required this.buttonText,
      this.bgColor = AppColor.mainColor,
      this.txtcolor = Colors.white,
      this.borderColor = Colors.transparent,
      this.btnwidth,
      this.btnHeight = 52,
      this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight,
      width: btnwidth ?? width(context) * 0.9,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shadowColor: AppColor.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: borderColor ?? AppColor.mainColor,
            ),
            borderRadius:
                BorderRadius.circular(borderRadius), // Button border radius
          ),
        ),
        child: AppTextWidget(
          text: buttonText,
          fontSize: 20,
          textColor: txtcolor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
