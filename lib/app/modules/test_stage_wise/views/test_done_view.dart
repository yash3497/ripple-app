import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class TestDoneView extends StatelessWidget {
  const TestDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.until((route) => route.settings.name == Routes.HOME);

        return false;
      },
      child: Scaffold(
        appBar: CommanAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.until((route) => route.settings.name == Routes.HOME);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 15,
                    ),
                    addHorizontalySpace(5),
                    AppTextWidget(
                      text: "Back",
                      fontSize: 16,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  AppTextWidget(
                    text: "Well Done!",
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    textColor: AppColor.greenColor,
                  ),
                  AppTextWidget(
                    text:
                        "You have successfully completed the 4 stage balance test",
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    textColor: AppColor.black,
                  )
                ],
              ),
              Column(
                children: [
                  AppButton(
                    onPressed: () {
                      Get.until((route) => route.settings.name == Routes.HOME);
                    },
                    buttonText: "Done",
                    bgColor: AppColor.greenColor,
                  ),
                  addVerticalSpace(15),
                  AppButton(
                    onPressed: () {},
                    buttonText: "Next Test",
                    bgColor: AppColor.greenColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
