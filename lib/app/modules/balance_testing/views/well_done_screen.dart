import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/bindings/balance_testing_binding.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/controllers/balance_testing_controller.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/views/balance_testing_view.dart';
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
        body: GetBuilder<BalanceTestingController>(builder: (controller) {
          return CustomGradientBackground(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              addVerticalSpace(10),
              !controller.isStop
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppTextWidget(
                          text: "Well Done!",
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          textColor: Color(0xFF424770),
                        ),
                        AppTextWidget(
                          text:
                              "You have completed ${controller.exercisePointer + 1} of 5 exercise",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          textColor: Color(0xFF7E8199),
                        ),
                        AppTextWidget(
                          text:
                              "Your Score is ${controller.questionPoints[controller.exercisePointer]}",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          textColor: Color(0xFF424770),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Image.asset(
                          "assets/images/stop_exercise.png",
                          width: width(context) * .5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: AppTextWidget(
                            text: "You stopped the exercise",
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            textColor: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.exercisePointer < 4
                      ? AppTextWidget(
                          text: "Would You like to :",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  addVerticalSpace(9),
                  controller.exercisePointer < 4
                      ? AppButton(
                          onPressed: () {
                            controller.isStop = false;
                            if (controller.exercisePointer < 4) {
                              controller.exercisePointer += 1;
                              Get.off(() => BalanceTestingView());
                            }
                          },
                          buttonText: "Next Exercise",
                          bgColor: AppColor.steadyButtonColor,
                        )
                      : AppButton(
                          onPressed: () {
                            controller.isStop = false;
                            controller.exercisePointer = 0;
                            controller.questionPoints = [0, 0, 0, 0, 0];
                            controller.update();
                            Get.to(
                              () => GreatJobView(),
                            );
                          },
                          buttonText: "Done",
                          bgColor: AppColor.steadyButtonColor,
                        ),
                  addVerticalSpace(15),
                  controller.exercisePointer < 4
                      ? AppButton(
                          onPressed: () {
                            if (controller.isStop) {
                              controller.isStop = false;
                              Get.until((route) =>
                                  route.settings.name ==
                                  Routes.STEADY_STEPS_DASHBOARD);
                            } else {
                              controller.isStop = true;
                              controller.update();
                            }
                          },
                          buttonText: "Stop",
                          bgColor: AppColor.errorColor,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  addVerticalSpace(8),
                ],
              )
            ],
          ));
        }),
      ),
    );
  }
}
