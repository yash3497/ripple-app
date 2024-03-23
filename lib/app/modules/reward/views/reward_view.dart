import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/profile/views/profile_view.dart';
import 'package:ripple_healthcare/app/modules/reward/bindings/reward_binding.dart';
import 'package:ripple_healthcare/app/modules/reward/views/refferal_screen.dart';
import 'package:ripple_healthcare/app/modules/reward/views/rewards_list_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/reward_controller.dart';

class RewardView extends GetView<RewardController> {
  const RewardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommanAppbar(
          isSteadyStep: true,
        ),
        body: CustomGradientBackground(
          child: Column(
            children: [
              CustomBackButton(),
              addVerticalSpace(20),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => RewardsListView(), binding: RewardBinding());
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 150,
                          width: 156,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Color(0xFF7C85C9), Color(0xFFE0E3F8)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                text: "Rewards",
                                fontSize: 20,
                                textColor: Colors.white,
                              ),
                              AppTextWidget(
                                text: "Win exciting rewards",
                                fontSize: 16,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            "assets/images/rewardCoin.png",
                            height: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                  addHorizontalySpace(15),
                  InkWell(
                    onTap: () {
                      Get.to(() => ReffaralScreen(), binding: RewardBinding());
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 150,
                          width: 156,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Color(0xFF7C85C9), Color(0xFFE0E3F8)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                text: "Referrals",
                                fontSize: 20,
                                textColor: Colors.white,
                              ),
                              AppTextWidget(
                                text: "Invite your friends",
                                fontSize: 16,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 7,
                          right: 0,
                          child: Image.asset(
                            "assets/images/referrals.png",
                            height: 80,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
