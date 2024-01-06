import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';

import '../../utils/constant_variable.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color bgColor;
  final Color txtcolor;
  final double? btnwidth;

  AppButton({
    required this.onPressed,
    required this.buttonText,
    this.bgColor = AppColor.greenColor,
    this.txtcolor = Colors.white,
    this.btnwidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.07,
      width: btnwidth ?? width(context) * 0.9,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: bgColor, // Background color
          onPrimary: txtcolor, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Button border radius
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
