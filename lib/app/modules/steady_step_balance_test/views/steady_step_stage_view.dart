import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/controllers/steady_step_balance_test_controller.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class SteadyStepStageView extends StatelessWidget {
  const SteadyStepStageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SteadyStepBalanceTestController>(builder: (controller) {
      return Scaffold(
        appBar: CommanAppbar(
          isSteadyStep: true,
        ),
        body: CustomGradientBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.isTimerStart
                  ? SizedBox(
                      width: Get.width,
                      height: Get.height * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppTextWidget(
                            text:
                                "Stage ${controller.stageCounter} will start in",
                            fontSize: 28,
                            // fontWeight: FontWeight.w600,
                            textColor: AppColor.purpleColor,
                          ),
                          AppTextWidget(
                            text: controller.testStartTimer.toString(),
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            textColor: AppColor.steadyTextColor,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.testIsStart)
                          AppTextWidget(
                            text: "4 Stage balance test",
                            fontSize: 24,
                            textColor: AppColor.purpleColor,
                          ),
                        AppTextWidget(
                          text: "Stage ${controller.stageCounter}:",
                          fontSize: 28,
                          textColor: AppColor.purpleColor,
                        ),
                        addVerticalSpace(5),
                        AppTextWidget(
                          text: controller.stageCounter == 1
                              ? "Stand with your feet side by side."
                              : "Touch the instep of one foot to the big toe of the other.",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        addVerticalSpace(20),
                        controller.testIsStart
                            ? Center(
                                child: AppTextWidget(
                                  text: "0:${controller.testPlayTimer}",
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  textColor: controller.testPlayTimer < 6
                                      ? Colors.red
                                      : AppColor.steadyTextColor,
                                ),
                              )
                            : AppTextWidget(
                                text:
                                    "You have to perform this exercise for 10 seconds.",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                        addVerticalSpace(10),
                        Image.asset(controller.stageCounter == 1
                            ? "assets/images/feet.png"
                            : "assets/images/manVid.png"),
                        addVerticalSpace(Get.height * 0.07),
                        if (!controller.testIsStart)
                          AppButton(
                            onPressed: () {
                              if (controller.stageCounter > 1) {
                                controller.testEnd = true;
                              }
                              controller.startTimer();
                            },
                            buttonText:
                                "Start Stage ${controller.stageCounter}",
                            bgColor: AppColor.steadyTextColor,
                          ),
                      ],
                    )
            ],
          ),
        ),
      );
    });
  }
}
