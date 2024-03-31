import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/bindings/balance_testing_binding.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/controllers/balance_testing_controller.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/views/congratulation_screen.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/views/great_job_view.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class WellDoneScreen extends GetView<BalanceTestingController> {
  const WellDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.until(
            (route) => route.settings.name == Routes.STEADY_STEPS_DASHBOARD);
        return false;
      },
      child: Scaffold(
        appBar: const CommanAppbar(isSteadyStep: true),
        body: CustomGradientBackground(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            addVerticalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextWidget(
                  text: "Well Done!",
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  textColor: Color(0xFF424770),
                ),
                AppTextWidget(
                  text: "You have completed 1 of 10 exercise",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textColor: Color(0xFF7E8199),
                ),
                AppTextWidget(
                  text: "Your Score is 10",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  textColor: Color(0xFF424770),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: "Would You like to :",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                addVerticalSpace(9),
                AppButton(
                  onPressed: () {
                    Get.to(
                      () => GreatJobView(),
                    );
                  },
                  buttonText: "Next Exercise",
                  bgColor: AppColor.steadyButtonColor,
                ),
                addVerticalSpace(15),
                AppButton(
                  onPressed: () {
                    Get.until((route) =>
                        route.settings.name == Routes.STEADY_STEPS_DASHBOARD);
                  },
                  buttonText: "Stop",
                  bgColor: AppColor.errorColor,
                ),
                addVerticalSpace(8),
              ],
            )
          ],
        )),
      ),
    );
  }
}
