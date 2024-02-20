import 'package:get/get.dart';

import '../controllers/balance_testing_controller.dart';

class BalanceTestingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BalanceTestingController>(
      () => BalanceTestingController(),
    );
  }
}
