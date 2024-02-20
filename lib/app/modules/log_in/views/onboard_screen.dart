import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(Get.height * 0.1),
          Image.asset(
            "assets/images/startedImage.png",
            fit: BoxFit.cover,
            height: Get.height * 0.45,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: "Say hello to health!",
                  fontSize: 28,
                ),
                addVerticalSpace(5),
                AppTextWidget(
                    text:
                        "Seamlessly switch between managing physical health products and personalized workouts."),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppButton(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    buttonText: "Get Started"),
                addVerticalSpace(15),
                AppButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOG_IN);
                  },
                  buttonText: "Log in",
                  bgColor: AppColor.lightBgColor,
                  txtcolor: AppColor.mainColor,
                ),
                addVerticalSpace(30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
