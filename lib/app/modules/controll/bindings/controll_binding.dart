import 'package:get/get.dart';

import '../controllers/controll_controller.dart';

class ControllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllController>(
      () => ControllController(),
    );
  }
}
