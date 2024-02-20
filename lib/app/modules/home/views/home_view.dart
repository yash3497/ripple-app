import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColor.mainColor,
                    child: Center(
                      child: AppTextWidget(
                        text: "A",
                        fontSize: 30,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  addHorizontalySpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextWidget(
                        text: "Welcome",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textColor: AppColor.mainColor,
                      ),
                      AppTextWidget(
                        text: "Arjit Sharma",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textColor: AppColor.mainColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
            addVerticalSpace(40),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "What brings you\n",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColor.headingTextColor)),
              TextSpan(
                  text: "to Ripple Health?",
                  style:
                      TextStyle(fontSize: 28, color: AppColor.headingTextColor))
            ])),
            addVerticalSpace(30),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.HIP_PRO_BLUETOOTH_FLOW);
              },
              child: Container(
                height: 172,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Color(0xFFDBDCFF),
                      // Color(0xFFC2B4E6),
                      // Color(0xFFAA99D8)
                      AppColor.mainColor,
                      AppColor.mainColor.withOpacity(0.05),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                            text: "Hip Pro +",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.white,
                          ),
                          addVerticalSpace(10),
                          AppTextWidget(
                            text:
                                "Guarding every step,belted protection for Golden Years",
                            textColor: AppColor.white,
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/hipProTab.png",
                      height: 140,
                      // width: 135,
                    ),
                  ],
                ),
              ),
            ),
            addVerticalSpace(20),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.STEADY_STEPS_ONBOARDING);
              },
              child: Container(
                height: 172,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Color(0xFFFFE2D8),
                      // Color(0xFFFFB6B3),
                      AppColor.mainColor,
                      AppColor.mainColor.withOpacity(0.05),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                            text: "Steady Steps",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.white,
                          ),
                          addVerticalSpace(10),
                          AppTextWidget(
                            text: "Empowering Elders, One Step at a Time.",
                            textColor: AppColor.white,
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/stedyStepTab.png",
                      height: 110,
                      // width: 135,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
