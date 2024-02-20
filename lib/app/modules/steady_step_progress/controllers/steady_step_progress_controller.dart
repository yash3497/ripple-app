import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/walking_steps_chart/controllers/walking_steps_chart_controller.dart';

class SteadyStepProgressController extends GetxController {
  //TODO: Implement SteadyStepProgressController

  List<ChartData> weekData = [
    ChartData('29 Jan', 6),
    ChartData('30 Jan', 4),
    ChartData('31 Jan', 5),
    ChartData('01 Feb', 1),
    ChartData('02 Feb', 3),
    ChartData('03 Feb', 7),
    ChartData('04 Feb', 2),
  ];
  List<ChartData> sixWeeksData = [
    ChartData('18 Dec', 3),
    ChartData('25 Dec', 4),
    ChartData('01 Jan', 6),
    ChartData('08 Jan', 2),
    ChartData('15 Jan', 5),
    ChartData('22 Jan', 2),
  ];

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
