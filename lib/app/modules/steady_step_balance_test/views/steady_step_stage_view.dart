import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/controllers/steady_step_balance_test_controller.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/services/app_services.dart';
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
                                "Stage ${controller.stageCounter + 1} will start in",
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
                        if (controller.testIsStart)
                          AppTextWidget(
                            text:
                                "${controller.balanceTests[controller.test].title}",
                            fontSize: 28,
                            textColor: AppColor.purpleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        AppTextWidget(
                          text: "Stage ${controller.stageCounter + 1}:",
                          fontSize: 24,
                          textColor: AppColor.purpleColor,
                          fontWeight: FontWeight.w500,
                        ),
                        addVerticalSpace(5),
                        AppTextWidget(
                          text:
                              "${controller.balanceTests[controller.test].stages[controller.stageCounter].instruction}",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        addVerticalSpace(20),
                        controller.testIsStart
                            ? Center(
                                child: AppTextWidget(
                                  text:
                                      "${AppServices.formatSecondsToTimeString(controller.testPlayTimer)}",
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  textColor: controller.testPlayTimer < 6
                                      ? AppColor.errorColor
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
                        Image.network(
                          controller.balanceTests[controller.test]
                              .stages[controller.stageCounter].demo,
                          height: height(context) * .45,
                          width: width(context),
                          fit: BoxFit.fill,
                        ),
                        addVerticalSpace(Get.height * 0.07),
                        if (!controller.testIsStart)
                          AppButton(
                            onPressed: () {
                              controller.startTimer();
                              if (controller.stageCounter ==
                                  controller.balanceTests[controller.test]
                                          .stages.length -
                                      1) {
                                controller.testEnd = true;
                              }
                            },
                            buttonText:
                                "Start Stage ${controller.stageCounter + 1}",
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
