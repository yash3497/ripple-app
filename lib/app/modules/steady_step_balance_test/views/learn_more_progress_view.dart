// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/controllers/steady_step_balance_test_controller.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class LearnMoreProgressView extends GetView<SteadyStepBalanceTestController> {
  const LearnMoreProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppButton(
          onPressed: () {
            Get.back();
          },
          buttonText: "Close",
          bgColor: AppColor.steadyColorBlue,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              addVerticalSpace(20),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.balanceTests.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        addVerticalSpace(10),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: index == 0
                                  ? controller.fourstages > 5
                                      ? AppColor.darkGreen
                                      : AppColor.errorColor
                                  : index == 4
                                      ? controller.stand > 5
                                          ? AppColor.darkGreen
                                          : AppColor.errorColor
                                      : index == 1
                                          ? controller.exerciseTimer[0] > 12.5
                                              ? AppColor.errorColor
                                              : AppColor.darkGreen
                                          : index == 2
                                              ? controller.exerciseTimer[1] >
                                                      12.5
                                                  ? AppColor.errorColor
                                                  : AppColor.darkGreen
                                              : index == 3
                                                  ? controller.exerciseTimer[
                                                              2] >
                                                          12.5
                                                      ? AppColor.errorColor
                                                      : AppColor.darkGreen
                                                  : AppColor.errorColor,
                              radius: 12,
                              child: Icon(
                                index == 0
                                    ? controller.fourstages > 5
                                        ? Icons.check
                                        : Icons.close
                                    : index == 4
                                        ? controller.stand > 5
                                            ? Icons.check
                                            : Icons.close
                                        : index == 1
                                            ? controller.exerciseTimer[0] > 12.5
                                                ? Icons.close
                                                : Icons.check
                                            : index == 2
                                                ? controller.exerciseTimer[1] >
                                                        12.5
                                                    ? Icons.close
                                                    : Icons.check
                                                : index == 3
                                                    ? controller.exerciseTimer[
                                                                2] >
                                                            12.5
                                                        ? Icons.close
                                                        : Icons.check
                                                    : Icons.close,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            addHorizontalySpace(10),
                            Expanded(
                                child: AppTextWidget(
                              text: "${controller.balanceTests[index].title}",
                              fontSize: 16,
                            )),
                            addHorizontalySpace(15),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: index == 0
                                      ? controller.fourstages > 5
                                          ? AppColor.lightgreen
                                          : AppColor.lightred
                                      : index == 4
                                          ? controller.stand > 5
                                              ? AppColor.lightgreen
                                              : AppColor.lightred
                                          : index == 1
                                              ? controller.exerciseTimer[0] >
                                                      12.5
                                                  ? AppColor.lightred
                                                  : AppColor.lightgreen
                                              : index == 2
                                                  ? controller.exerciseTimer[
                                                              1] >
                                                          12.5
                                                      ? AppColor.lightred
                                                      : AppColor.lightgreen
                                                  : index == 3
                                                      ? controller.exerciseTimer[
                                                                  2] >
                                                              12.5
                                                          ? AppColor.lightred
                                                          : AppColor.lightgreen
                                                      : AppColor.lightred
                                                          .withOpacity(.5),
                                  border: Border.all(
                                      color: index == 0
                                          ? controller.fourstages > 5
                                              ? AppColor.darkGreen
                                              : AppColor.errorColor
                                          : index == 4
                                              ? controller.stand > 5
                                                  ? AppColor.darkGreen
                                                  : AppColor.errorColor
                                              : index == 1
                                                  ? controller.exerciseTimer[
                                                              0] >
                                                          12.5
                                                      ? AppColor.errorColor
                                                      : AppColor.darkGreen
                                                  : index == 2
                                                      ? controller.exerciseTimer[
                                                                  1] >
                                                              12.5
                                                          ? AppColor.errorColor
                                                          : AppColor.darkGreen
                                                      : index == 3
                                                          ? controller.exerciseTimer[
                                                                      2] >
                                                                  12.5
                                                              ? AppColor
                                                                  .errorColor
                                                              : AppColor
                                                                  .greenColor
                                                          : AppColor
                                                              .errorColor)),
                              child: AppTextWidget(
                                text: index == 0
                                    ? controller.fourstages > 5
                                        ? "Low Risk"
                                        : "High Risk"
                                    : index == 4
                                        ? controller.stand > 5
                                            ? "Low Risk"
                                            : "High Risk"
                                        : index == 1
                                            ? controller.exerciseTimer[0] > 12.5
                                                ? "High Risk"
                                                : "Low Risk"
                                            : index == 2
                                                ? controller.exerciseTimer[1] >
                                                        12.5
                                                    ? "High Risk"
                                                    : "Low Risk"
                                                : index == 3
                                                    ? controller.exerciseTimer[
                                                                2] >
                                                            12.5
                                                        ? "High Risk"
                                                        : "Low Risk"
                                                    : "High Risk",
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(15),
                        ProgressBar(
                          value: index == 0
                              ? controller.fourstages / 10
                              : index == 4
                                  ? controller.stand / 10
                                  : index == 1
                                      ? controller.exerciseTimer[0] > 12.5
                                          ? .4
                                          : .8
                                      : index == 2
                                          ? controller.exerciseTimer[1] > 12.5
                                              ? .4
                                              : .8
                                          : index == 3
                                              ? controller.exerciseTimer[2] >
                                                      12.5
                                                  ? .4
                                                  : .8
                                              : .4,

                          width: Get.width * 0.9,
                          //specify only one: color or gradient
                          color: index == 0
                              ? controller.fourstages > 5
                                  ? AppColor.darkGreen
                                  : AppColor.errorColor
                              : index == 4
                                  ? controller.stand > 5
                                      ? AppColor.darkGreen
                                      : AppColor.errorColor
                                  : index == 1
                                      ? controller.exerciseTimer[0] > 12.5
                                          ? AppColor.errorColor
                                          : AppColor.darkGreen
                                      : index == 2
                                          ? controller.exerciseTimer[1] > 12.5
                                              ? AppColor.errorColor
                                              : AppColor.darkGreen
                                          : index == 3
                                              ? controller.exerciseTimer[2] >
                                                      12.5
                                                  ? AppColor.errorColor
                                                  : AppColor.darkGreen
                                              : AppColor.errorColor,
                          backgroundColor: Colors.grey.shade300,
                        ),
                        Divider(
                          thickness: 1,
                          height: 40,
                        )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
