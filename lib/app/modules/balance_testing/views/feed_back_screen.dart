import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/controllers/balance_testing_controller.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class TodaysFeedback extends GetView<BalanceTestingController> {
  const TodaysFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Today’s Feedback"),
        centerTitle: true,
      ),
      body: CustomGradientBackground(
        child: GetBuilder<BalanceTestingController>(builder: (ct) {
          PageController _pageController = PageController();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) {
                        controller.indicator = value;
                        controller.update();
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.questionList.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextWidget(
                              text: controller.questionList[index]
                                      ["question"] ??
                                  "",
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              textColor: AppColor.textGreenColor,
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(left: Get.width * 0.35),
                              height: 12,
                              child: ListView.builder(
                                  itemCount: controller.questionList.length,
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
                                                  ? AppColor.mainColor
                                                  : AppColor.textGreenColor
                                                      .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            addVerticalSpace(10),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .questionList[index]["optionList"].length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: AppButton(
                                        bgColor: AppColor.steadyTextColor,
                                        onPressed: () {
                                          _pageController.animateToPage(
                                              controller.indicator + 1,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.easeInOut);
                                          controller.indicator++;
                                          controller.update(); // Update the UI
                                          // }
                                          if (controller.indicator >
                                              controller.questionList.length -
                                                  1) {
                                            Get.until((route) =>
                                                route.settings.name ==
                                                Routes.STEADY_STEPS_DASHBOARD);
                                          }
                                        },
                                        buttonText:
                                            controller.questionList[index]
                                                ["optionList"][i]),
                                  );
                                }),
                          ],
                        );
                      }),
                ),
                addVerticalSpace(0),
              ],
            ),
          );
        }),
      ),
    );
  }
}
