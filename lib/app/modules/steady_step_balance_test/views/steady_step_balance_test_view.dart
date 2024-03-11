import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/views/steady_steps_balance_test2.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/steady_step_balance_test_controller.dart';

class SteadyStepBalanceTestView
    extends GetView<SteadyStepBalanceTestController> {
  const SteadyStepBalanceTestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommanAppbar(
        isSteadyStep: true,
      ),
      body: Container(
        width: Get.width,
        padding: EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF62699F),
              Color(0xFFBAC9FE),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GetBuilder<SteadyStepBalanceTestController>(builder: (ct) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    if (controller.isInstructionTab) {
                      controller.isInstructionTab = false;
                      controller.update();
                    } else {
                      Get.back();
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 15,
                        color: AppColor.white,
                      ),
                      addHorizontalySpace(5),
                      AppTextWidget(
                        text: "Back",
                        fontSize: 16,
                        textColor: AppColor.white,
                      )
                    ],
                  ),
                ),
                addVerticalSpace(Get.height * 0.06),
                AppTextWidget(
                  text: "${controller.balanceTests[controller.test].title}",
                  fontSize: 50,
                  textColor: AppColor.white,
                ),
                addVerticalSpace(20),
                !controller.isInstructionTab
                    ? AppTextWidget(
                        text:
                            "${controller.balanceTests[controller.test].description}",
                        fontSize: 16,
                        textColor: AppColor.white,
                      )
                    : SizedBox(
                        height: height(context) * .4,
                        child: SingleChildScrollView(
                          child: AppTextWidget(
                            text:
                                "${controller.balanceTests[controller.test].instructions.replaceAll("\\n", "\n")}",
                            fontSize: 16,
                            textColor: AppColor.white,
                          ),
                        ),
                      ),
                Spacer(),
                if (!controller.isInstructionTab)
                  AppButton(
                    onPressed: () {
                      controller.isInstructionTab = true;
                      controller.update();
                    },
                    buttonText: "Instruction",
                    bgColor: AppColor.steadyTextColor,
                  ),
                addVerticalSpace(10),
                AppButton(
                  onPressed: () {
                    if (controller
                        .balanceTests[controller.test].stages.isNotEmpty) {
                      Get.toNamed(Routes.STEADY_STEP_STAGE_VIEW);
                    } else {
                      Get.off(() => SteadyStepBalanceTest2());
                    }
                  },
                  buttonText: "Take Test",
                  bgColor: AppColor.buttonLightColor2,
                  // borderColor: AppColor.buttonBorderColor,
                  txtcolor: AppColor.steadyTextColor,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
