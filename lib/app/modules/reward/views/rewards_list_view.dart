import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/profile/views/profile_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/reward_controller.dart';

class RewardsListView extends GetView<RewardController> {
  const RewardsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                addVerticalSpace(20),
                AppTextWidget(
                  text: "Win exciting rewards ",
                  textColor: AppColor.steadyTextColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
                addVerticalSpace(15),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.rewardList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.all(10),
                              height: 150,
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF7C85C9),
                                      Color(0xFFE0E3F8)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextWidget(
                                    text: controller.rewardList[index]["title"],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 14,
                              child: Image.asset(
                                controller.rewardList[index]["img"],
                                height: 100,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
