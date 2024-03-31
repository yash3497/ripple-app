import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/utils/const_new.dart';

import '../controllers/steady_steps_onboarding_controller.dart';

class SteadyStepsOnboardingView
    extends GetView<SteadyStepsOnboardingController> {
  const SteadyStepsOnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SteadyStepsOnboardingController>(initState: (state) {
      Future.delayed(Duration(seconds: 6), () {
        Get.toNamed(Routes.STEADY_STEPS_PAGEVIEW);
      });
    }, builder: (ct) {
      return Scaffold(
        body: Image.asset(
          "assets/images/steady_steps_main.gif",
          width: width(context, 1),
          height: height(context, 1),
          fit: BoxFit.fill,
        ),
        /*Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: Get.height * .83,
            width: Get.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/steadySteps.png"),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/images/steadyStepSub.png")],
              ),
            ),
          )
        ],
      )*/
      );
    });
  }
}
