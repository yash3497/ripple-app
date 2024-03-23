import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/profile/views/profile_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class ReffaralScreen extends StatelessWidget {
  const ReffaralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommanAppbar(
        notificationHide: true,
        isSteadyStep: true,
      ),
      body: CustomGradientBackground(
          child: Column(
        children: [
          CustomBackButton(),
          addVerticalSpace(20),
          AppTextWidget(
            text: "Invite friends to Steady Steps",
            fontSize: 28,
            fontWeight: FontWeight.w500,
            textColor: AppColor.steadyTextColor,
          ),
          AppTextWidget(
            text: "Invite friends to Steady Steps and get ₹11 in your account.",
            fontSize: 20,
            textColor: AppColor.steadyTextColor,
          ),
          addVerticalSpace(15),
          Row(
            children: [
              AppButton(
                onPressed: () {},
                buttonText: "Invite",
                borderRadius: 50,
                btnHeight: 45,
                bgColor: AppColor.steadyColorBlue,
                btnwidth: Get.width * 0.3,
              ),
              Spacer(),
              Image.asset(
                "assets/images/refferal2.png",
                height: 110,
              )
            ],
          )
        ],
      )),
    );
  }
}
