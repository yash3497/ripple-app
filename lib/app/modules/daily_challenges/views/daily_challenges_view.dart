import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/profile/views/profile_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/daily_challenges_controller.dart';

class DailyChallengesView extends GetView<DailyChallengesController> {
  const DailyChallengesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DailyChallengesController>(builder: (ct) {
      return Scaffold(
          appBar: const CommanAppbar(
            isSteadyStep: true,
          ),
          body: CustomGradientBackground(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  addVerticalSpace(10),
                  AppTextWidget(
                    text: "Today’s Challenge",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    textColor: AppColor.steadyTextColor,
                  ),
                  addVerticalSpace(15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.DAILY_CHALLENGES_TEST_VIEW);
                      },
                      child: Image.asset(
                        "assets/images/dailyChallengesBanner.png",
                        width: Get.width,
                        height: Get.height * 0.23,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  addVerticalSpace(30),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                            text: "Challenges Done",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.steadyTextColor,
                          ),
                          AppTextWidget(
                            text: "Have a look on your victories",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            // textColor: AppColor.steadyTextColor,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.steadyTextColor),
                        child: DropdownButton<String>(
                            iconEnabledColor: Colors.white,
                            dropdownColor: AppColor.steadyTextColor,
                            underline: const SizedBox(),
                            style: const TextStyle(fontSize: 14),
                            value: controller.selectedWeek,
                            items: controller.weekDropDownList
                                .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: AppTextWidget(
                                      text: e,
                                      textColor: Colors.white,
                                    )))
                                .toList(),
                            onChanged: (value) {
                              controller.selectedWeek = value!;
                              controller.update();
                            }),
                      )
                    ],
                  ),
                  addVerticalSpace(15),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return const DailyChallengesItemCard();
                      })
                ],
              ),
            ),
          ));
    });
  }
}

class DailyChallengesItemCard extends StatelessWidget {
  const DailyChallengesItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade400)],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppTextWidget(
                text: "40 Seconds 40 Questions",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textColor: AppColor.steadyTextColor,
              ),
              const Spacer(),
              AppTextWidget(
                text: "Thu, 01 Feb 2024",
                fontSize: 12,
                textColor: AppColor.textGrayColor,
              )
            ],
          ),
          addVerticalSpace(3),
          Row(
            children: [
              const ImageIcon(
                AssetImage("assets/images/exercising.png"),
                size: 15,
                color: AppColor.textGrayColor,
              ),
              addHorizontalySpace(4),
              AppTextWidget(
                text: "Arm Raise",
                fontSize: 12,
                textColor: AppColor.textGrayColor,
              ),
              addHorizontalySpace(10),
              const ImageIcon(
                AssetImage("assets/images/watch.png"),
                size: 15,
                color: AppColor.textGrayColor,
              ),
              addHorizontalySpace(4),
              AppTextWidget(
                text: "40 sec",
                fontSize: 12,
                textColor: AppColor.textGrayColor,
              ),
            ],
          ),
          AppTextWidget(
            text: "21/40",
            fontSize: 48,
            fontWeight: FontWeight.w700,
            textColor: AppColor.steadyTextColor,
          )
        ],
      ),
    );
  }
}
