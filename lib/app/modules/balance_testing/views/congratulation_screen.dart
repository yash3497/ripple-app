import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/views/feed_back_screen.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommanAppbar(
        isSteadyStep: true,
      ),
      body: CustomGradientBackground(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            children: [
              AppTextWidget(
                text: "Congratulations!",
                fontSize: 32,
                fontWeight: FontWeight.w700,
                textColor: AppColor.steadyTextColor,
              ),
              addVerticalSpace(10),
              AppTextWidget(
                text:
                    "You have completed all of your exercise for today.\n\nMake sure to come back tomorrow.Consistency is key!",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          AppButton(
            onPressed: () {
              Get.to(() => TodaysFeedback());
            },
            buttonText: "Ok",
            bgColor: AppColor.steadyTextColor,
          )
        ],
      )),
    );
  }
}
