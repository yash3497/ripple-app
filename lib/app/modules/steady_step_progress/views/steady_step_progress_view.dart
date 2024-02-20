import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/profile/views/profile_view.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../walking_steps_chart/controllers/walking_steps_chart_controller.dart';
import '../controllers/steady_step_progress_controller.dart';

class SteadyStepProgressView extends GetView<SteadyStepProgressController> {
  const SteadyStepProgressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommanAppbar(
          isSteadyStep: true,
        ),
        body: CustomGradientBackground(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(),
              addVerticalSpace(15),
              AppTextWidget(
                text: "Your Progress",
                fontSize: 28,
              ),
              addVerticalSpace(10),
              Center(
                child: Image.asset(
                  "assets/images/progressBanner.png",
                  height: Get.height * 0.26,
                ),
              ),
              addVerticalSpace(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: Get.width * 0.85,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                            text: "This Week",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.steadyTextColor,
                          ),
                          AppTextWidget(
                            text: "29 Jan 2024 - 4 Feb 2024",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.black,
                          ),
                          SfCartesianChart(
                              primaryXAxis: CategoryAxis(
                                labelStyle: TextStyle(fontSize: 10),
                              ),
                              primaryYAxis: const NumericAxis(
                                  isVisible: false,
                                  minimum: 0,
                                  maximum: 8,
                                  interval: 2),
                              // tooltipBehavior: _tooltip,
                              series: <CartesianSeries<ChartData, String>>[
                                ColumnSeries<ChartData, String>(
                                    dataSource: controller.weekData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    name: '',
                                    width: 0.5,
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF5A62A7),
                                          Color(0xFFDCE0FA)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    color: AppColor.greenColor)
                              ]),
                        ],
                      ),
                    ),
                    addHorizontalySpace(10),
                    Container(
                      width: Get.width * 0.85,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                            text: "Your Last 6 Weeks",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.steadyTextColor,
                          ),
                          AppTextWidget(
                            text: "25 Dec 2023 - 29 Jan 2024",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textColor: AppColor.black,
                          ),
                          SfCartesianChart(
                              primaryXAxis: const CategoryAxis(
                                labelStyle: TextStyle(fontSize: 10),
                              ),
                              primaryYAxis: const NumericAxis(
                                  isVisible: false,
                                  minimum: 0,
                                  maximum: 8,
                                  interval: 2),
                              // tooltipBehavior: _tooltip,
                              series: <CartesianSeries<ChartData, String>>[
                                ColumnSeries<ChartData, String>(
                                    dataSource: controller.sixWeeksData,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    name: '',
                                    width: 0.5,
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF5A62A7),
                                          Color(0xFFDCE0FA)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    color: AppColor.greenColor)
                              ]),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
