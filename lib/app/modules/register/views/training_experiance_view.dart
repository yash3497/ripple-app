import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:ripple_healthcare/app/modules/register/controllers/register_controller.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../../../widget/common_back_button.dart';

class TrainingExperianceView extends GetView<RegisterController> {
  const TrainingExperianceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Column(
          children: [
            CommonBackButton(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<RegisterController>(builder: (ct) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: "Almost Done",
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                AppTextWidget(
                  text:
                      "Select one or more to Personalize your training experience.",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                addVerticalSpace(30),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, i) {
                      return InkWell(
                        onTap: () {
                          controller.trainingExp[i]['isSelected'] =
                              !controller.trainingExp[i]['isSelected'];
                          controller.update();
                        },
                        child: Container(
                          decoration:
                              kFillBoxDecoration(0, AppColor.boxColor, 15),
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Spacer(),
                                  Icon(
                                    controller.trainingExp[i]['isSelected'] ==
                                            false
                                        ? Icons.check_circle_outline
                                        : Icons.check_circle,
                                    color: controller.trainingExp[i]
                                                ['isSelected'] ==
                                            false
                                        ? AppColor.textGrayColor
                                        : AppColor.black,
                                  )
                                ],
                              ),
                              AppTextWidget(
                                text: controller.trainingExp[i]['title'],
                                fontSize: 16,
                              ),
                              addVerticalSpace(4),
                              AppTextWidget(
                                text: controller.trainingExp[i]['desc'],
                                fontSize: 12,
                                textColor: AppColor.textGrayColor,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, i) {
                      return addVerticalSpace(10);
                    },
                    itemCount: controller.trainingExp.length),
                addVerticalSpace(20),
                AppButton(
                    onPressed: () {
                      Get.toNamed(Routes.SUCCESS_VIEW);
                    },
                    buttonText: 'Done')
              ],
            );
          }),
        ),
      ),
    );
  }
}
