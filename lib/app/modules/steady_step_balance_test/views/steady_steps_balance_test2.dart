import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/controllers/steady_step_balance_test_controller.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/views/test_done_and_feedback_screen.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/services/app_services.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class SteadyStepBalanceTest2 extends StatelessWidget {
  const SteadyStepBalanceTest2({super.key});

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
                                "${controller.balanceTests[controller.test].title} will start in",
                            fontSize: 24,
                            // fontWeight: FontWeight.w600,
                            textColor: AppColor.purpleColor,
                          ),
                          AppTextWidget(
                            text: controller.testStartTimer.toString(),
                            fontSize: 100,
                            fontWeight: FontWeight.w600,
                            textColor: AppColor.steadyTextColor,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(
                          text:
                              "${controller.balanceTests[controller.test].title}",
                          fontSize: 28,
                          textColor: AppColor.purpleColor,
                          fontWeight: FontWeight.w500,
                        ),
                        addVerticalSpace(5),
                        AppTextWidget(
                          text:
                              "${controller.balanceTests[controller.test].shortDescription}",
                          fontSize: 16,
                        ),
                        addVerticalSpace(20),
                        controller.testIsStart
                            ? Center(
                                child: AppTextWidget(
                                  text:
                                      "${AppServices.formatSecondsToTimeString(controller.testPlayTimer2)}",
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  textColor: controller.testPlayTimer < 6
                                      ? Colors.red
                                      : AppColor.steadyTextColor,
                                ),
                              )
                            : SizedBox(),
                        addVerticalSpace(10),
                        Image.network(
                          controller.balanceTests[controller.test].demo,
                          height: height(context) * .45,
                          width: width(context),
                          fit: BoxFit.fill,
                        ),
                        addVerticalSpace(Get.height * 0.07),
                        if (!controller.testIsStart)
                          AppButton(
                            onPressed: () {
                              if (controller
                                      .balanceTests[controller.test].timer ==
                                  0) {
                                controller.startTimer3(controller
                                    .balanceTests[controller.test].timer);
                              } else {
                                controller.startTimer2(controller
                                    .balanceTests[controller.test].timer);
                              }
                            },
                            buttonText: "Start Test",
                            bgColor: AppColor.steadyTextColor,
                          ),
                        if (controller.balanceTests[controller.test].timer ==
                                0 &&
                            controller.testIsStart)
                          AppButton(
                            onPressed: () {
                              controller.testIsStart = false;
                              controller.timer3.cancel();
                              controller.exerciseTimer
                                  .add(controller.testPlayTimer2);
                              Get.to(() => SteadyStepTestDoneView());
                            },
                            buttonText: "End Test",
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
