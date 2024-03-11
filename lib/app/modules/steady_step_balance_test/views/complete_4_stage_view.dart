import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/views/your_balance_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class Completed4StageView extends StatelessWidget {
  const Completed4StageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommanAppbar(
        isSteadyStep: true,
      ),
      body: CustomGradientBackground(
          child: Column(
        children: [
          AppTextWidget(
            text: "Have you completed the test according to the instructions?",
            fontSize: 20,
          ),
          Spacer(),
          AppButton(
            onPressed: () {
              Get.to(() => YourBalanceAgeView());
            },
            buttonText: "Yes",
            bgColor: AppColor.steadyColorBlue,
          ),
          addVerticalSpace(10),
          AppButton(
            onPressed: () {
              Get.until((route) =>
                  route.settings.name == Routes.STEADY_STEPS_DASHBOARD);
            },
            buttonText: "No",
            bgColor: AppColor.steadyColorBlue,
          )
        ],
      )),
    );
  }
}
