import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';

import '../../../../utils/constant_variable.dart';

class SuccessFullyLoginScreen extends StatelessWidget {
  const SuccessFullyLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(Get.height * 0.1),
          Center(
            child: Image.asset(
              "assets/images/congrats.png",
              height: Get.height * 0.34,
            ),
          ),
          addVerticalSpace(Get.height * 0.02),
          AppTextWidget(
            text: "Congratulations",
            textColor: AppColor.textGreenColor,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextWidget(
              text:
                  "You have successfully logged in to the app. Click on the continue button to enjoy your benefits.",
              textColor: AppColor.textGreenColor,
              textAlign: TextAlign.center,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          AppButton(
              onPressed: () {
                if (Get.arguments['register']) {
                  Get.toNamed(Routes.HELLO_SCREEN);
                } else {
                  Get.toNamed(Routes.STEADY_STEPS_ONBOARDING);
                }
              },
              buttonText: "Continue"),
          addVerticalSpace(40)
        ],
      ),
    );
  }
}
