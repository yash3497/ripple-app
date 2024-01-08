import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ripple_healthcare/app/modules/log_in/controllers/log_in_controller.dart';

import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';

import '../../../../utils/constant_variable.dart';
import '../../../widget/app_text_widget.dart';
import '../../../widget/common_back_button.dart';

class OtpVerifyView extends GetView<LogInController> {
  const OtpVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.updateTimer();
    return Scaffold(
        appBar: AppBar(
          leading: const Column(
            children: [
              CommonBackButton(),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.otpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(20),
                AppTextWidget(
                  text: "OTP Verification",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                AppTextWidget(
                  text:
                      "Enter the verification code we just sent on your phone number.",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textGreyColor,
                ),
                addVerticalSpace(40),
                Pinput(
                  controller: controller.otpController,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: AppColor.black,
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.borderColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: AppColor.greenBorder,
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.greenBorder,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: AppColor.black,
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.greenBorder,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty || val.length != 4) {
                      return 'Incorrect pin';
                    }
                    return null;
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
                addVerticalSpace(20),
                AppButton(
                    onPressed: () {
                      if (controller.otpKey.currentState!.validate()) {
                        // controller.verifyOtp();
                        controller.login();
                      }
                    },
                    buttonText: "Verify"),
                addVerticalSpace(15),
                GetBuilder<LogInController>(builder: (controller) {
                  return Center(
                      child: Text(
                    "Request new code in 00:${controller.seconds}s",
                    style: TextStyle(color: AppColor.textGrayColor),
                  ));
                }),
                const Spacer(),
                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        const TextSpan(
                          text: "Didn’t received code?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColor.textGrayColor),
                        ),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: InkWell(
                              onTap: () {
                                controller.resendOtp();
                              },
                              child: const Text(
                                " Resend",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.greenColor),
                              ),
                            ))
                      ])),
                )
              ],
            ),
          ),
        ));
  }
}
