import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/log_in/controllers/log_in_controller.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../../../widget/app_button.dart';

class HelloScreen extends GetView<LogInController> {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(Get.height * 0.1),
            AppTextWidget(
              text: "Hello",
              fontSize: 28,
              textColor: AppColor.textGreenColor,
              fontWeight: FontWeight.w400,
            ),
            AppTextWidget(
              text: "${controller.users.name} 👋",
              fontSize: 28,
              fontWeight: FontWeight.w600,
              textColor: AppColor.textGreenColor,
            ),
            addVerticalSpace(20),
            AppTextWidget(
              text:
                  "Your wisdom is a treasure, and we believe that by personalizing your experience, we can create something truly special together.\n\nBy answering a few questions, you can tailor the app to your preferences and interests.",
              fontSize: 20,
              fontWeight: FontWeight.w400,
              textColor: AppColor.textGreenColor,
            ),
            Spacer(),
            AppButton(
                onPressed: () {
                  Get.toNamed(Routes.QUE_SCREEN);
                },
                buttonText: "Continue"),
            addVerticalSpace(17)
          ],
        ),
      ),
    );
  }
}
