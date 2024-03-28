import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/controllers/balance_testing_controller.dart';
import 'package:ripple_healthcare/app/modules/profile/views/profile_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/services/app_services.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';

import '../../../../utils/constant_variable.dart';

class MCQTestView extends StatelessWidget {
  const MCQTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BalanceTestingController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: CustomBackButton(),
          centerTitle: true,
          title: AppTextWidget(text: "Exercise 1"),
        ),
        body: CustomGradientBackground(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppTextWidget(
                  text: "Heel to toe Walk",
                  fontSize: 20,
                ),
                Spacer(),
                AppTextWidget(
                  text:
                      "${AppServices.formatSecondsToTimeString(controller.testPlayTimer)}",
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  textColor: controller.testPlayTimer <= 5
                      ? AppColor.errorColor
                      : AppColor.purpleColor,
                )
              ],
            ),
            Image.asset(
              "assets/images/toeWalk.png",
              height: 235,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            addVerticalSpace(20),
            AppTextWidget(
              text: "Odd One Out",
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            addVerticalSpace(10),
            ListView.builder(
                shrinkWrap: true,
                itemCount: controller.mcqList.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      controller.selectedMcqAnswer = index;
                      controller.update();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 45,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: controller.selectedMcqAnswer == index
                              ? AppColor.steadyButtonColor
                              : Colors.white,
                          border:
                              Border.all(width: 1, color: Color(0xFF8A94EB)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppTextWidget(
                            text: controller.mcqList[index],
                            fontSize: 20,
                            textColor: controller.selectedMcqAnswer == index
                                ? Colors.white
                                : AppColor.steadyTextColor,
                          ),
                        ],
                      ),
                    ),
                  );
                }))
          ],
        )),
      );
    });
  }
}
