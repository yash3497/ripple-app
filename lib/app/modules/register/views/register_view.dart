import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/custom_tetxt_field.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../../../../utils/app_colors.dart';
import '../../../widget/app_text_widget.dart';
import '../../../widget/common_back_button.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Column(
            children: [
              Obx(
                () {
                  print(controller.tempBool);
                  return CommonBackButton(
                    onTap: () {
                      controller.isAgeSelectView
                          ? controller.isAgeSelectView = false
                          : Get.back();
                      controller.update();
                    },
                  );
                },
              ),
            ],
          ),
        ),
        body: GetBuilder<RegisterController>(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: controller.registerFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(20),
                  AppTextWidget(
                    text: controller.isAgeSelectView
                        ? "Hi,${controller.fistNameController.text}"
                        : "Enter Name",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  AppTextWidget(
                    text: controller.isAgeSelectView
                        ? "Please enter your age and gender."
                        : "Please enter your name as per legal id.",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textColor: AppColor.textGreyColor,
                  ),
                  const Spacer(),
                  !controller.isAgeSelectView
                      ? Column(
                          children: [
                            CustomTextField(
                              controller: controller.fistNameController,
                              hintText: 'First Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your first name!";
                                }
                                return null;
                              },
                              isFill: true,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              suffixIcon:
                                  const Icon(Icons.person_outline_rounded),
                            ),
                            addVerticalSpace(15),
                            CustomTextField(
                              isFill: true,
                              hintText: 'Last Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your last name!";
                                }
                                return null;
                              },
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            CustomTextField(
                              controller: controller.ageController,
                              keyboardType: TextInputType.number,
                              hintText: 'Enter Your Age',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your age";
                                }
                                return null;
                              },
                              isFill: true,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            addVerticalSpace(15),
                            SizedBox(
                              height: Get.height * 0.06,
                              child: ListView.builder(
                                  itemCount: controller.genderList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, i) {
                                    return InkWell(
                                      onTap: () {
                                        controller.selectedGender = i;
                                        controller.update();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    controller.selectedGender ==
                                                            i
                                                        ? AppColor.black
                                                        : AppColor.borderColor),
                                            color: AppColor.fillColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AppTextWidget(
                                                text: controller.genderList[i],
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                textColor:
                                                    AppColor.textGrayColor,
                                              ),
                                              addHorizontalySpace(10),
                                              i == 0
                                                  ? const Icon(
                                                      Icons.male,
                                                      color: AppColor.blueColor,
                                                    )
                                                  : i == 1
                                                      ? const Icon(
                                                          Icons.female,
                                                          color:
                                                              Color(0xFFBD0CAB),
                                                        )
                                                      : const SizedBox.shrink()
                                            ]),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                  addVerticalSpace(40),
                  const Spacer(),
                  AppButton(
                      onPressed: () {
                        if (controller.registerFormKey.currentState
                                ?.validate() ??
                            false) {
                          if (controller.isAgeSelectView) {
                            Get.toNamed(Routes.TRAINING_EXP);
                          } else {
                            controller.isAgeSelectView = true;
                            controller.update();
                          }
                        }
                      },
                      buttonText: "Next"),
                  addVerticalSpace(20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 6,
                          width: 22,
                          decoration: kFillBoxDecoration(
                              0,
                              controller.isAgeSelectView == false
                                  ? AppColor.black
                                  : AppColor.borderColor,
                              5),
                        ),
                        addHorizontalySpace(7),
                        Container(
                          height: 6,
                          width: 22,
                          decoration: kFillBoxDecoration(
                              0,
                              controller.isAgeSelectView == true
                                  ? AppColor.black
                                  : AppColor.borderColor,
                              5),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
