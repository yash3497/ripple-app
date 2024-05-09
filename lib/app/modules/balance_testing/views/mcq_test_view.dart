import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/balance_testing/controllers/balance_testing_controller.dart';
import 'package:ripple_healthcare/app/modules/profile/views/profile_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/alert_dialog.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/services/app_services.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';

import '../../../../utils/constant_variable.dart';

class MCQTestView extends StatelessWidget {
  const MCQTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BalanceTestingController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          quitDialog(context, () {
            Get.back();
            Get.offAllNamed(Routes.STEADY_STEPS_DASHBOARD);
          });
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 80,
            leading: CustomBackButton(
              onTap: () {
                quitDialog(context, () {
                  Get.back();
                  Get.offAllNamed(Routes.STEADY_STEPS_DASHBOARD);
                });
              },
            ),
            centerTitle: true,
            title: AppTextWidget(
                text: "Exercise ${controller.exercisePointer + 1}"),
          ),
          body: CustomGradientBackground(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppTextWidget(
                      text:
                          "${controller.trainingList[controller.exercisePointer].title}",
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "${controller.trainingList[controller.exercisePointer].demo}",
                    height: 235,
                    width: Get.width,
                    fit: BoxFit.fill,
                  ),
                ),
                addVerticalSpace(20),
                AppTextWidget(
                  text:
                      "${controller.questions[controller.randomIndex].questionText}",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                addVerticalSpace(10),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller
                        .questions[controller.randomIndex].options.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () async {
                          controller.selectedMcqAnswer = index;
                          controller.update();
                          await Future.delayed(Duration(milliseconds: 100));
                          if (controller.questions[controller.randomIndex]
                                  .options[index] ==
                              controller.questions[controller.randomIndex]
                                  .correctOption) {
                            controller.questionPoints[
                                controller.exercisePointer] += 1;
                          }
                          controller.randomIndex = AppServices()
                              .getRandomIndex(controller.questions.length);

                          controller.selectedMcqAnswer = null;
                          controller.update();
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.only(
                              left: 22, right: 15, top: 10, bottom: 10),
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: controller.selectedMcqAnswer == index
                                  ? AppColor.steadyButtonColor
                                  : null,
                              border: Border.all(
                                  width: 1, color: Color(0xFF8A94EB)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppTextWidget(
                                text: controller
                                    .questions[controller.randomIndex]
                                    .options[index],
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
            ),
          )),
        ),
      );
    });
  }
}
