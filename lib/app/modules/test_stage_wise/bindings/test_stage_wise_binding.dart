import 'package:get/get.dart';

import '../controllers/test_stage_wise_controller.dart';

class TestStageWiseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestStageWiseController>(
      () => TestStageWiseController(),
    );
  }
}
