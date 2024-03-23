import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/test_stage_wise/controllers/test_stage_wise_controller.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class StageView extends GetView<TestStageWiseController> {
  const StageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestStageWiseController>(builder: (ct) {
      return Scaffold(
        appBar: CommanAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.greenColor,
                          ),
                          AppTextWidget(
                            text: controller.testStartTimer.toString(),
                            fontSize: 128,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.greenColor,
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
                            textColor: AppColor.greenColor,
                          ),
                        AppTextWidget(
                          text: "Stage ${controller.stageCounter}:",
                          fontSize: 28,
                          textColor: AppColor.greenColor,
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
                                      ? AppColor.errorColor
                                      : AppColor.greenColor,
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
                            bgColor: AppColor.greenColor,
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
