import 'package:get/get.dart';

import '../controllers/hip_pro_bluetooth_flow_controller.dart';

class HipProBluetoothFlowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HipProBluetoothFlowController>(
      () => HipProBluetoothFlowController(),
    );
  }
}
