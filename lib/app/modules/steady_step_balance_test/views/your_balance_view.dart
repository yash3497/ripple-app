import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/views/learn_more_progress_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class YourBalanceAgeView extends StatelessWidget {
  const YourBalanceAgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommanAppbar(
        isSteadyStep: true,
      ),
      body: CustomGradientBackground(
          child: Column(
        children: [
          addVerticalSpace(30),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: Colors.black54)),
            child: AppTextWidget(
              text: "Actual age: 56",
              fontSize: 12,
            ),
          ),
          addVerticalSpace(20),
          AppTextWidget(
            text: "Your Balance Age",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          AppTextWidget(
            text: "50",
            fontSize: 64,
            fontWeight: FontWeight.w600,
            textColor: Color(0xFF40A35A),
          ),
          addVerticalSpace(20),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Color(0xFFEFFFF3),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.shade500,
                      offset: Offset(0, 4))
                ]),
            child: AppTextWidget(
                text:
                    "Excellent! 🌟 Your Balance Age is well within the acceptable range. "),
          ),
          addVerticalSpace(20),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.shade500,
                      offset: Offset(0, 4))
                ]),
            child: Column(
              children: [
                Row(
                  children: [
                    AppTextWidget(
                      text: "Mobility Assessment",
                      fontSize: 16,
                    ),
                    Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFEFFFF3),
                          border: Border.all(color: Colors.green)),
                      child: AppTextWidget(
                        text: "Low Risk",
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                AppTextWidget(
                  text: "Download Report",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  textDecoration: TextDecoration.underline,
                ),
                addVerticalSpace(40),
                InkWell(
                  onTap: () {
                    Get.to(() => LearnMoreProgressView());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Colors.black54)),
                    child: AppTextWidget(
                      text: "Learn More",
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          AppButton(
            onPressed: () {},
            buttonText: "Start Exercise",
            bgColor: AppColor.steadyColorBlue,
          ),
          addVerticalSpace(10),
          AppButton(
            onPressed: () {
              Get.until((route) =>
                  route.settings.name == Routes.STEADY_STEPS_DASHBOARD);
            },
            buttonText: "Done",
            bgColor: AppColor.steadyColorBlue,
          )
        ],
      )),
    );
  }
}
