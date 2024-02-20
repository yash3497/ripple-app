import 'package:get/get.dart';

import '../controllers/walking_steps_chart_controller.dart';

class WalkingStepsChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalkingStepsChartController>(
      () => WalkingStepsChartController(),
    );
  }
}
