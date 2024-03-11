import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/log_in/controllers/log_in_controller.dart';
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
    return WillPopScope(
      onWillPop: () async {
        if (controller.isAgeSelectView > 0) {
          controller.isAgeSelectView--;
          controller.update();
        }
        if (controller.isAgeSelectView == 0) {
          Get.back();
        }

        controller.update();
        return false;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: Column(
              children: [
                CommonBackButton(
                  onTap: () {
                    if (controller.isAgeSelectView > 0) {
                      controller.isAgeSelectView--;
                      controller.update();
                    }
                    if (controller.isAgeSelectView == 0) {
                      Get.back();
                    }

                    controller.update();
                  },
                )
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
                      text: controller.isAgeSelectView == 1
                          ? "Select Your Gender"
                          : controller.isAgeSelectView == 0
                              ? "Enter Your Name"
                              : "Enter Your Age",
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    AppTextWidget(
                      text: controller.isAgeSelectView == 0
                          ? "Please enter your name as per your Voter ID"
                          : "",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textColor: AppColor.textGrayColor,
                    ),
                    addVerticalSpace(40),
                    controller.isAgeSelectView == 0
                        ? Column(
                            children: [
                              CustomTextField(
                                controller: controller.fistNameController,
                                hintText: 'Enter Name',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your name!";
                                  }
                                  return null;
                                },
                                isFill: true,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                                // suffixIcon:
                                //     const Icon(Icons.person_outline_rounded),
                              ),
                              addVerticalSpace(15),
                            ],
                          )
                        : controller.isAgeSelectView == 1
                            ? Column(
                                children: [
                                  addVerticalSpace(15),
                                  SizedBox(
                                    // height: Get.height * 0.06,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.genderList.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (ctx, i) {
                                          return InkWell(
                                            onTap: () {
                                              controller.selectedGender = i;
                                              controller.update();
                                            },
                                            child: Container(
                                              height: Get.height * 0.07,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              margin: const EdgeInsets.only(
                                                  right: 15, bottom: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          AppColor.mainColor),
                                                  color: controller
                                                              .selectedGender ==
                                                          i
                                                      ? AppColor.mainColor
                                                      : AppColor.borderColor,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    AppTextWidget(
                                                      text: controller
                                                          .genderList[i],
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      textColor: controller
                                                                  .selectedGender ==
                                                              i
                                                          ? AppColor.white
                                                          : AppColor.black,
                                                    ),
                                                    addHorizontalySpace(10),
                                                    i == 0
                                                        ? const Icon(
                                                            Icons.male,
                                                            color: AppColor
                                                                .blueColor,
                                                          )
                                                        : i == 1
                                                            ? const Icon(
                                                                Icons.female,
                                                                color: Color(
                                                                    0xFFBD0CAB),
                                                              )
                                                            : const SizedBox
                                                                .shrink()
                                                  ]),
                                            ),
                                          );
                                        }),
                                  )
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                    addVerticalSpace(40),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.only(left: Get.width * 0.4),
                      height: 12,
                      child: ListView.builder(
                          itemCount: 3,
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
                                      color: controller.isAgeSelectView == i
                                          ? AppColor.mainColor
                                          : AppColor.textGreenColor
                                              .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ],
                            );
                          }),
                    ),
                    addVerticalSpace(15),
                    AppButton(
                        onPressed: () {
                          // controller.isAgeSelectView++;

                          if (controller.registerFormKey.currentState
                                  ?.validate() ??
                              false) {
                            if (controller.isAgeSelectView > 1) {
                              Get.put(LogInController()).users.name =
                                  controller.fistNameController.text;
                              Get.put(LogInController()).users.gender =
                                  controller.selectedGender == 0
                                      ? "Male"
                                      : "Female";
                              Get.put(LogInController()).users.age =
                                  int.parse(controller.ageController.text);
                              Get.toNamed(Routes.LOG_IN,
                                  arguments: {'register': true});
                            } else {
                              controller.isAgeSelectView++;
                              print(controller.isAgeSelectView);
                              controller.update();
                            }
                          }
                        },
                        buttonText: controller.isAgeSelectView == 2
                            ? "Continue"
                            : "Next"),
                    addVerticalSpace(20),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
