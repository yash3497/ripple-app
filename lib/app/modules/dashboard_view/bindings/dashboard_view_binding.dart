import 'package:get/get.dart';

import '../controllers/dashboard_view_controller.dart';

class DashboardViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardViewController>(
      () => DashboardViewController(),
    );
  }
}
