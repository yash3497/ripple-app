import 'package:get/get.dart';

import '../controllers/steady_step_progress_controller.dart';

class SteadyStepProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SteadyStepProgressController>(
      () => SteadyStepProgressController(),
    );
  }
}
