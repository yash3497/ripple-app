import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ripple_healthcare/app/modules/log_in/controllers/log_in_controller.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';

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
          leadingWidth: Get.width * 0.3,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Row(
              children: [
                addHorizontalySpace(15),
                Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                ),
                addHorizontalySpace(6),
                AppTextWidget(
                  text: "Back",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: AppColor.textGreenColor,
                ),
              ],
            ),
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
                  text: "Enter OTP code",
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.textGreenColor,
                ),
                AppTextWidget(
                  text:
                      "A 4-digit OTP has been sent to your phone number ending with ******${controller.phoneNumberController.text.substring(6, 10)}",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.textGrayColor,
                ),
                addVerticalSpace(40),
                Pinput(
                  controller: controller.otpController,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  onChanged: (value) {
                    controller.update();
                  },
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: AppColor.black,
                        fontFamily: "Urbanist",
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      color: AppColor.otpBgColor,
                      border: Border.all(color: AppColor.mainColor),
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
                Spacer(),
                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        const TextSpan(
                          text: "Didn’t received code?",
                          style: TextStyle(
                              fontFamily: "Urbanist",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.textGrayColor),
                        ),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: InkWell(
                              onTap: () {
                                controller.resendOtp(Get.arguments['register']);
                              },
                              child: const Text(
                                " Resend",
                                style: TextStyle(
                                    fontFamily: "Urbanist",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.mainColor),
                              ),
                            ))
                      ])),
                ),
                addVerticalSpace(5),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      " Change number?",
                      style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.mainColor),
                    ),
                  ),
                ),
                addVerticalSpace(15),
                GetBuilder<LogInController>(builder: (cont) {
                  return AppButton(
                      bgColor: controller.otpController.text.length > 3
                          ? AppColor.mainColor
                          : AppColor.disableColor,
                      onPressed: () {
                        if (controller.otpKey.currentState!.validate()) {
                          // controller.verifyOtp();
                          if (Get.arguments['register']) {
                            controller.verifyOtp(true);
                          } else {
                            controller.verifyOtp(false);
                          }
                        }
                      },
                      buttonText: "Verify");
                }),
                addVerticalSpace(15),
                // GetBuilder<LogInController>(builder: (controller) {
                //   return Center(
                //       child: Text(
                //     "Request new code in 00:${controller.seconds}s",
                //     style: TextStyle(color: AppColor.textGrayColor),
                //   ));
                // }),
              ],
            ),
          ),
        ));
  }
}
