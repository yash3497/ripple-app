import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/steady_steps_dashboard_controller.dart';

class SteadyStepsDashboardView extends GetView<SteadyStepsDashboardController> {
  const SteadyStepsDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommanAppbar(
          isSteadyStep: true,
        ),
        body: CustomGradientBackground(
            padding: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextWidget(
                      text: "Hello Anjali👋",
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      textColor: AppColor.steadyTextColor,
                    ),
                    AppTextWidget(
                      text: "Start your day with",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      textColor: AppColor.black,
                    ),
                    addVerticalSpace(15),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SteadyStepCategoryCard(
                            img: controller.SteadyStepCat[index]['img'],
                            subTitle: controller.SteadyStepCat[index]
                                ['subTitle'],
                            title: controller.SteadyStepCat[index]['title'],
                            onTap: () {
                              if (index == 0) {
                                Get.toNamed(Routes.BALANCE_TESTING);
                              } else if (index == 1) {
                                Get.toNamed(Routes.STEADY_STEP_PROGRESS);
                              } else if (index == 2) {
                                Get.toNamed(Routes.DAILY_CHALLENGES);
                              } else if (index == 3) {
                                Get.toNamed(Routes.STEADY_STEP_BALANCE_TEST);
                              } else if (index == 4) {
                                Get.toNamed(Routes.REWARD);
                              }
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return addVerticalSpace(15);
                        },
                        itemCount: controller.SteadyStepCat.length)
                  ],
                ),
              ),
            )));
  }
}

class SteadyStepCategoryCard extends StatelessWidget {
  const SteadyStepCategoryCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.img,
    required this.onTap,
  });
  final String title;
  final String subTitle;
  final String img;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [Color(0xFF6F78BD), Color(0xFF9D9FD9)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                    text: title,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    textColor: AppColor.white,
                  ),
                  AppTextWidget(
                    text: subTitle,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: AppColor.white,
                  )
                ],
              ),
            ),
            Image.asset("assets/images/$img")
          ],
        ),
      ),
    );
  }
}
