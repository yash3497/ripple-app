import 'package:get/get.dart';

import '../controllers/steady_steps_dashboard_controller.dart';

class SteadyStepsDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SteadyStepsDashboardController>(
      () => SteadyStepsDashboardController(),
    );
  }
}
