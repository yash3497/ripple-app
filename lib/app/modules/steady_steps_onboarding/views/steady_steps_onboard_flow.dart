import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/controllers/steady_steps_onboarding_controller.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class SteadyStepsPageView extends GetView<SteadyStepsOnboardingController> {
  const SteadyStepsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<SteadyStepsOnboardingController>(builder: (ct) {
        PageController _pageController = PageController();
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    controller.indicator = value;
                    controller.update();
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.onboardList.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: Get.height * 0.55,
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFCBD6FF),
                                Color(0xFFF8FCFF),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Image.asset(
                              controller.onboardList[index].img ?? ""),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: Get.height * 0.4,
                            width: Get.width,
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextWidget(
                                  text:
                                      (controller.onboardList[index].subTitle ??
                                              "")
                                          .toUpperCase(),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColor.steadyColorBlue,
                                ),
                                AppTextWidget(
                                  text:
                                      controller.onboardList[index].title ?? "",
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColor.steadyColorBlue,
                                ),
                                AppTextWidget(
                                  text:
                                      controller.onboardList[index].desc ?? "",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColor.textGrayColor,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 45,
                  ),
                  Container(
                    height: 12,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.onboardList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) {
                          return Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 4),
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    color: controller.indicator == i
                                        ? AppColor.steadyColorBlue
                                        : AppColor.textGreenColor
                                            .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ],
                          );
                        }),
                  ),
                  InkWell(
                    onTap: () {
                      _pageController.animateToPage(controller.indicator + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      controller.indicator++;
                      controller.update(); // Update the UI
                      // }
                      if (controller.indicator >
                          controller.onboardList.length - 1) {
                        Get.toNamed(Routes.STEADY_STEPS_DASHBOARD);
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: AppColor.steadyColorBlue,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class CustomGradientBackground extends StatelessWidget {
  final Widget child;
  final double padding;

  CustomGradientBackground({required this.child, this.padding = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(padding),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFCBD6FF),
            Color(0xFFF8FCFF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
