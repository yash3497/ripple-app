import 'package:get/get.dart';

class ControllController extends GetxController {
  //TODO: Implement ControllController

  RxBool isInflation = false.obs;
  RxBool isSos = false.obs;
  RxBool isFlash = false.obs;
  RxBool isBattery = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
