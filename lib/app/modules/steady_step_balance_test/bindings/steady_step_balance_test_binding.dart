import 'package:get/get.dart';

import '../controllers/steady_step_balance_test_controller.dart';

class SteadyStepBalanceTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SteadyStepBalanceTestController>(
      () => SteadyStepBalanceTestController(),
    );
  }
}
