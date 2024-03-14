import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/controllers/steady_step_balance_test_controller.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/views/learn_more_progress_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_dashboard/controllers/steady_steps_dashboard_controller.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class YourBalanceAgeView extends StatefulWidget {
  const YourBalanceAgeView({super.key});

  @override
  State<YourBalanceAgeView> createState() => _YourBalanceAgeViewState();
}

class _YourBalanceAgeViewState extends State<YourBalanceAgeView> {
  var userController = Get.find<SteadyStepsDashboardController>();
  var controller = Get.find<SteadyStepBalanceTestController>();
  int age = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int value = controller.exerciseTimer[1];
    if (value < 11.4) {
      age = 60;
    } else if (value < 12.6) {
      age = 70;
    } else {
      age = 80;
    }
    setState(() {});
  }

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
              text: "Actual age: ${userController.users.age}",
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
            text: "$age",
            fontSize: 64,
            fontWeight: FontWeight.w600,
            textColor: age <= userController.users.age
                ? AppColor.greenColor
                : AppColor.errorColor,
          ),
          addVerticalSpace(20),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: age <= userController.users.age + 10
                    ? AppColor.lightgreen
                    : AppColor.lightred,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.shade500,
                      offset: Offset(0, 4))
                ]),
            child: AppTextWidget(
                text: age <= userController.users.age
                    ? "Excellent! 🌟 Your Balance Age is well within the acceptable range. "
                    : age <= userController.users.age + 10
                        ? "Good! 🌟 Your Balance Age is slightly above the acceptable range. "
                        : "Not Good! 🌟 Your Balance Age is not within the acceptable range. "),
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
                          color: age <= userController.users.age + 10
                              ? AppColor.lightgreen
                              : AppColor.lightred,
                          border: Border.all(
                              color: age <= userController.users.age + 10
                                  ? AppColor.greenColor
                                  : AppColor.errorColor)),
                      child: AppTextWidget(
                        text: age <= userController.users.age
                            ? "Low Risk"
                            : age <= userController.users.age + 10
                                ? "Moderate Risk"
                                : "High Risk",
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                // AppTextWidget(
                //   text: "Download Report",
                //   fontSize: 12,
                //   fontWeight: FontWeight.w600,
                //   textDecoration: TextDecoration.underline,
                // ),
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
            onPressed: () {
              Get.offAllNamed(Routes.STEADY_STEP_BALANCE_TEST);
            },
            buttonText: "Start Exercise",
            bgColor: AppColor.steadyColorBlue,
          ),
          addVerticalSpace(10),
          AppButton(
            onPressed: () {
              Get.offAllNamed(Routes.STEADY_STEPS_DASHBOARD);
            },
            buttonText: "Done",
            bgColor: AppColor.steadyColorBlue,
          )
        ],
      )),
    );
  }
}
