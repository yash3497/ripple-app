import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/bindings/balance_testing_binding.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/profile/views/profile_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/balance_testing_controller.dart';

class BalanceTestingView extends GetView<BalanceTestingController> {
  const BalanceTestingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BalanceTestingController>(builder: (ct) {
      return WillPopScope(
        onWillPop: () async {
          if (controller.isInstruction == true) {
            controller.isInstruction = false;
            controller.update();
          } else {
            Get.back();
          }
          return false;
        },
        child: Scaffold(
            appBar: CommanAppbar(
              isSteadyStep: true,
            ),
            body: GetBuilder<BalanceTestingController>(builder: (controller) {
              return CustomGradientBackground(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBackButton(
                      onTap: () {
                        if (controller.isInstruction == true) {
                          controller.isInstruction = false;
                          controller.update();
                        } else {
                          Get.back();
                        }
                      },
                    ),
                    addVerticalSpace(6),
                    AppTextWidget(
                      text: controller.isInstruction
                          ? "Instructions"
                          : "Exercise ${controller.exercisePointer + 1}:",
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      textColor: AppColor.steadyTextColor,
                    ),
                    controller.isInstruction
                        ? AppTextWidget(
                            text:
                                " ${controller.trainingList[controller.exercisePointer].instructions}",
                            fontSize: 20,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                text:
                                    "${controller.trainingList[controller.exercisePointer].title}",
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                textColor: AppColor.black,
                              ),
                              addVerticalSpace(40),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "${controller.trainingList[controller.exercisePointer].demo}",
                                  width: width(context),
                                ),
                              ),
                            ],
                          ),
                    Spacer(),
                    if (!controller.isInstruction)
                      AppButton(
                        onPressed: () {
                          controller.isInstruction = true;
                          controller.update();
                        },
                        buttonText: "Instructions",
                        bgColor: AppColor.steadyButtonColor,
                      ),
                    addVerticalSpace(15),
                    AppButton(
                      onPressed: () {
                        controller.startTimer();
                        Get.to(() => GetReadyForTestScreen(),
                            binding: BalanceTestingBinding());
                      },
                      buttonText: "Start Training",
                      bgColor: controller.isInstruction == true
                          ? AppColor.steadyButtonColor
                          : AppColor.white,
                      borderColor: controller.isInstruction == true
                          ? Colors.transparent
                          : AppColor.borderColor,
                      txtcolor: controller.isInstruction == true
                          ? Colors.white
                          : AppColor.steadyTextColor,
                    ),
                    addVerticalSpace(20),
                  ],
                ),
              );
            })),
      );
    });
  }
}

class GetReadyForTestScreen extends GetView<BalanceTestingController> {
  const GetReadyForTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommanAppbar(isSteadyStep: true),
      body: GetBuilder<BalanceTestingController>(builder: (context) {
        return CustomGradientBackground(
            child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextWidget(
                text: "Get Ready in",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                textColor: AppColor.steadyTextColor,
              ),
              AppTextWidget(
                text: controller.testStartTimer.toString(),
                fontSize: 128,
                fontWeight: FontWeight.w700,
                textColor: AppColor.steadyTextColor,
              )
            ],
          ),
        ));
      }),
    );
  }
}
