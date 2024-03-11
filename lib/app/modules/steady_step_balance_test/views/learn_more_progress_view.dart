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
          onPressed: () {},
          buttonText: "Colse",
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
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        addVerticalSpace(10),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColor.darkGreen,
                              radius: 12,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            addHorizontalySpace(10),
                            Expanded(
                                child: AppTextWidget(
                              text: "Four Stage Balance Test",
                              fontSize: 16,
                            )),
                            addHorizontalySpace(15),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFFEFFFF3),
                                  border: Border.all(color: Colors.green)),
                              child: AppTextWidget(
                                text: "Low Risk",
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(15),
                        ProgressBar(
                          value: 0.9,
                          width: Get.width * 0.9,
                          //specify only one: color or gradient
                          color: AppColor.darkGreen,
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
