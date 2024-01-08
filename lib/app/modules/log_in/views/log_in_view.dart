// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/app/widget/custom_tetxt_field.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(30),
              AppTextWidget(
                text: "Enter Phone",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              AppTextWidget(
                text: "Please enter your phone number",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                textColor: AppColor.textGreyColor,
              ),
              Spacer(),
              CustomTextField(
                controller: controller.phoneNumberController,
                hintText: "Enter Mobile Number",
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a mobile number';
                  } else if (value.length != 10 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Invalid mobile number';
                  }
                  return null;
                },
                prefixIcon: SizedBox(
                  width: Get.width * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "  +91",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        width: 1,
                        height: 25,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
                isFill: true,
                inputFormater: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
              Spacer(),
              AppButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.sendOtp();
                    }
                  },
                  buttonText: "Send Code"),
              addVerticalSpace(10),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text:
                          "By registering your account confirm that you agree with our ",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textGrayColor),
                    ),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: InkWell(
                          child: Text(
                            "Term and Condition",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColor.black),
                          ),
                        ))
                  ]))
            ],
          ),
        ),
      ),
    ));
  }
}
