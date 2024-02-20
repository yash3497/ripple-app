import 'package:get/get.dart';

import '../controllers/steady_steps_onboarding_controller.dart';

class SteadyStepsOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SteadyStepsOnboardingController>(
      () => SteadyStepsOnboardingController(),
    );
  }
}
