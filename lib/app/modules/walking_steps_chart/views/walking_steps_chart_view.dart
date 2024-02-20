import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/walking_steps_chart_controller.dart';

class WalkingStepsChartView extends GetView<WalkingStepsChartController> {
  const WalkingStepsChartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalkingStepsChartController>(builder: (context) {
      return Scaffold(
        appBar: const CommanAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 15,
                    ),
                    addHorizontalySpace(5),
                    AppTextWidget(
                      text: "Back",
                      fontSize: 16,
                    )
                  ],
                ),
              ),
              addVerticalSpace(15),
              Container(
                height: Get.height * 0.05,
                width: Get.width,
                decoration: BoxDecoration(
                    color: const Color(0xFF767680).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8)),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.dayTypeList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.selectedIndex = index;
                              controller.update();
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              height: Get.height * 0.04,
                              width: Get.width * 0.27,
                              decoration: controller.selectedIndex == index
                                  ? BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5))
                                  : const BoxDecoration(),
                              child: Center(
                                child: AppTextWidget(
                                  text: controller.dayTypeList[index],
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              addVerticalSpace(15),
              AppTextWidget(
                text: "You have walked",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              Row(
                children: [
                  Text(
                    controller.selectedIndex == 0
                        ? "4,500"
                        : controller.selectedIndex == 1
                            ? "14,500"
                            : controller.selectedIndex == 2
                                ? "44,500"
                                : "",
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                  ),
                  addHorizontalySpace(10),
                  AppTextWidget(
                    text: "Steps",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              AppTextWidget(
                  text: controller.selectedIndex == 0
                      ? ""
                      : controller.selectedIndex == 1
                          ? "16-22 Jan 2024"
                          : "22 Dec 2023 - 22 Jan 2024"),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              if (controller.selectedIndex == 0)
                ChartWidget(
                  data: controller.todaysData,
                  maxNumber: 800,
                  interval: 200,
                ),
              if (controller.selectedIndex == 1)
                ChartWidget(
                  data: controller.weekData,
                  maxNumber: 8000,
                  interval: 2000,
                ),
              if (controller.selectedIndex == 2)
                ChartWidget(
                  data: controller.monthData,
                  maxNumber: 60000,
                  interval: 20000,
                ),
            ],
          ),
        ),
      );
    });
  }
}

class ChartWidget extends StatelessWidget {
  const ChartWidget(
      {super.key,
      required this.data,
      required this.maxNumber,
      required this.interval});
  final List<ChartData> data;
  final double maxNumber;
  final double interval;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis:
            NumericAxis(minimum: 0, maximum: maxNumber, interval: interval),
        // tooltipBehavior: _tooltip,
        series: <CartesianSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              name: 'Steps',
              color: AppColor.greenColor)
        ]);
  }
}
