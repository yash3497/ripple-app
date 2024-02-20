import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/daily_challenges/bindings/daily_challenges_binding.dart';
import 'package:ripple_healthcare/app/modules/daily_challenges/controllers/daily_challenges_controller.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/profile/views/profile_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../../../widget/app_text_widget.dart';

class DailyChallengesTestView extends GetView<DailyChallengesController> {
  const DailyChallengesTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommanAppbar(
        isSteadyStep: true,
      ),
      body: CustomGradientBackground(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBackButton(),
          addVerticalSpace(8),
          AppTextWidget(
            text: "Today’s Challenge",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            textColor: AppColor.steadyTextColor,
          ),
          addVerticalSpace(10),
          Row(
            children: [
              const ImageIcon(
                AssetImage("assets/images/exercising.png"),
                size: 25,
                color: AppColor.steadyTextColor,
              ),
              addHorizontalySpace(6),
              AppTextWidget(
                text: "Knee Lift",
                fontSize: 28,
                textColor: AppColor.steadyTextColor,
              ),
            ],
          ),
          Row(
            children: [
              const ImageIcon(
                AssetImage("assets/images/watch.png"),
                size: 25,
                color: AppColor.steadyTextColor,
              ),
              addHorizontalySpace(6),
              AppTextWidget(
                text: "30 Seconds",
                fontSize: 28,
                textColor: AppColor.steadyTextColor,
              ),
            ],
          ),
          Row(
            children: [
              const ImageIcon(
                AssetImage("assets/images/list.png"),
                size: 25,
                color: AppColor.steadyTextColor,
              ),
              addHorizontalySpace(6),
              AppTextWidget(
                text: "30 Questions",
                fontSize: 28,
                textColor: AppColor.steadyTextColor,
              ),
            ],
          ),
          addVerticalSpace(20),
          Image.asset(
            "assets/images/DL.png",
            height: Get.height * 0.3,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          Spacer(),
          AppButton(
            onPressed: () {
              Get.to(() => GetReadyDailyChallenges(),
                  binding: DailyChallengesBinding());
              controller.startTimer();
            },
            buttonText: "Start",
            bgColor: AppColor.steadyTextColor,
          ),
          addVerticalSpace(15)
        ],
      )),
    );
  }
}

class GetReadyDailyChallenges extends GetView<DailyChallengesController> {
  const GetReadyDailyChallenges({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommanAppbar(isSteadyStep: true),
      body: GetBuilder<DailyChallengesController>(builder: (context) {
        return CustomGradientBackground(
            child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextWidget(
                text: "Get Ready in",
                fontSize: 24,
                fontWeight: FontWeight.w500,
                textColor: AppColor.steadyTextColor,
              ),
              AppTextWidget(
                text: controller.testStartTimer.toString(),
                fontSize: 100,
                fontWeight: FontWeight.w700,
                textColor: AppColor.steadyTextColor,
              )
            ],
          ),
        ));
      }),
    );
  }
}
