import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/walking_steps_chart/views/walking_steps_chart_view.dart';

class WalkingStepsChartController extends GetxController {
  //TODO: Implement WalkingStepsChartController

  int selectedIndex = 0;
  List<String> dayTypeList = ["Today", "week", "Month"];
  List<ChartData> todaysData = [
    ChartData('12 AM', 600),
    ChartData('6 AM', 500),
    ChartData('9AM', 700),
    ChartData('12 PM', 500),
    ChartData('3PM', 600),
  ];
  List<ChartData> weekData = [
    ChartData('Mon', 6000),
    ChartData('Tue', 4000),
    ChartData('Wed', 5000),
    ChartData('Thu', 8000),
    ChartData('Fri', 3000),
    ChartData('Sat', 7000),
    ChartData('Sun', 6000),
  ];
  List<ChartData> monthData = [
    ChartData('1', 30000),
    ChartData('2', 40000),
    ChartData('3', 20000),
    ChartData('4', 8000),
    ChartData('5', 10000),
    ChartData('6', 15000),
    ChartData('7', 25000),
    ChartData('8', 30000),
    ChartData('9', 40000),
    ChartData('10', 20000),
    ChartData('11', 8000),
    ChartData('12', 10000),
    ChartData('13', 15000),
    ChartData('14', 25000),
    ChartData('15', 30000),
    ChartData('16', 40000),
    ChartData('17', 20000),
    ChartData('18', 8000),
    ChartData('19', 10000),
    ChartData('20', 15000),
    ChartData('21', 25000),
    ChartData('22', 30000),
    ChartData('23', 40000),
    ChartData('24', 20000),
    ChartData('25', 8000),
    ChartData('26', 10000),
    ChartData('27', 15000),
    ChartData('28', 25000),
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

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
