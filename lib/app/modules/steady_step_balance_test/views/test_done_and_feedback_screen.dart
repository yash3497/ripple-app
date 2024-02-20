import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/controllers/steady_step_balance_test_controller.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class SteadyStepTestDoneView extends StatelessWidget {
  const SteadyStepTestDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.until(
            (route) => route.settings.name == Routes.STEADY_STEPS_DASHBOARD);

        return false;
      },
      child: Scaffold(
        appBar: CommanAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.until((route) =>
                      route.settings.name == Routes.STEADY_STEPS_DASHBOARD);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 15,
                    ),
                    addHorizontalySpace(5),
                    AppTextWidget(
                      text: "Back",
                      fontSize: 16,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  AppTextWidget(
                    text: "Well Done!",
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    textColor: AppColor.steadyTextColor,
                  ),
                  AppTextWidget(
                    text:
                        "You have successfully completed the 4 stage balance test",
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    textColor: AppColor.purpleColor,
                  )
                ],
              ),
              Column(
                children: [
                  AppButton(
                    onPressed: () {
                      Get.until((route) =>
                          route.settings.name == Routes.STEADY_STEPS_DASHBOARD);
                    },
                    buttonText: "Done",
                    bgColor: AppColor.steadyTextColor,
                  ),
                  addVerticalSpace(15),
                  AppButton(
                    onPressed: () {
                      Get.to(() => FeedBackScreen());
                    },
                    buttonText: "Next Test",
                    bgColor: AppColor.steadyTextColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SteadyStepBalanceTestController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Feedback"),
        ),
        body: CustomGradientBackground(
            child: Column(
          children: [
            AppTextWidget(
              text: "Do you have any difficulties on any stage of this test?",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              textColor: AppColor.purpleColor,
            ),
            Spacer(),
            controller.selectStageView
                ? Column(
                    children: [
                      AppTextWidget(
                        text: "Select the stage that you find difficult:",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.purpleColor,
                      ),
                      addVerticalSpace(7),
                      GridView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2.5,
                          ),
                          itemBuilder: (context, index) {
                            return AppButton(
                                bgColor: AppColor.steadyTextColor,
                                onPressed: () {
                                  Get.until((route) =>
                                      route.settings.name ==
                                      Routes.STEADY_STEPS_DASHBOARD);
                                },
                                buttonText: "Stage ${index + 1}");
                          }),
                    ],
                  )
                : Column(
                    children: [
                      AppButton(
                        onPressed: () {
                          controller.selectStageView = true;
                          controller.update();
                        },
                        buttonText: "Yes",
                        bgColor: AppColor.steadyTextColor,
                      ),
                      addVerticalSpace(15),
                      AppButton(
                        onPressed: () {
                          Get.until((route) =>
                              route.settings.name ==
                              Routes.STEADY_STEPS_DASHBOARD);
                        },
                        buttonText: "No",
                        bgColor: AppColor.steadyTextColor,
                      ),
                    ],
                  ),
          ],
        )),
      );
    });
  }
}
