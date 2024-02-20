import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/test_stage_wise_controller.dart';

class TestStageWiseView extends GetView<TestStageWiseController> {
  const TestStageWiseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommanAppbar(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFDFFFF0),
              Color(0xFFF7FFF7),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: GetBuilder<TestStageWiseController>(builder: (ct) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      controller.isInstructionTab = false;
                      controller.update();
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
                  addVerticalSpace(Get.height * 0.06),
                  AppTextWidget(
                    text: "4 stage Balance Test",
                    fontSize: 50,
                    textColor: AppColor.greenColor,
                  ),
                  addVerticalSpace(20),
                  !controller.isInstructionTab
                      ? AppTextWidget(
                          text:
                              "The Four Stage Balance Test is a validated measure recommended to screen individuals for fall risk.",
                          fontSize: 16,
                          textColor: AppColor.black,
                        )
                      : Column(
                          children: [
                            AppTextWidget(
                              text:
                                  "There are four standing positions that you need to perform, each for 10 seconds.",
                              fontSize: 16,
                              textColor: AppColor.black,
                            ),
                            addVerticalSpace(5),
                            AppTextWidget(
                              text:
                                  "1.Stand with your feet side by side.\n2.Place the instep of one foot so it is touching the big toe of the other foot.\n3. Tandem stance, place one foot in front of the other, heel touching toes.\n4.sStand on one foot.\n\nFor optimal results we advise you to complete all the stages.",
                              fontSize: 16,
                              textColor: AppColor.black,
                            ),
                          ],
                        ),
                  Spacer(),
                  if (!controller.isInstructionTab)
                    AppButton(
                      onPressed: () {
                        controller.isInstructionTab = true;
                        controller.update();
                      },
                      buttonText: "Instruction",
                      bgColor: AppColor.greenColor,
                    ),
                  addVerticalSpace(10),
                  AppButton(
                    onPressed: () {
                      Get.toNamed(Routes.STAGE_VIEW);
                    },
                    buttonText: "Take Test",
                    bgColor: AppColor.buttonLightColor2,
                    borderColor: AppColor.buttonBorderColor,
                    txtcolor: AppColor.greenColor,
                  ),
                ],
              ),
            );
          }),
        ));
  }
}
