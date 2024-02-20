import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/dashboard_view_controller.dart';

class DashboardViewView extends GetView<DashboardViewController> {
  const DashboardViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: Get.width,
            color: AppColor.greenColor,
            child: Row(
              children: [
                AppTextWidget(
                  text: "You are Connected to your Hip Pro+",
                  textColor: AppColor.white,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 22,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppTextWidget(
                      text: "Good Morning!",
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                  ],
                ),
                addVerticalSpace(20),
                const UserLastSyncBoxWidget(),
                addVerticalSpace(10),
                Row(
                  children: [
                    AppTextWidget(
                      text: "Your Balance Score is low ",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    AppTextWidget(
                      text: "Start Exercise Today",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      textColor: AppColor.greenColor,
                    )
                  ],
                ),
                addVerticalSpace(15),
                AppTextWidget(
                  text: "Today’s Summary",
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
                addVerticalSpace(15),
                const TotalWearTimeWidget(),
                addVerticalSpace(20),
                const BalanceScoreWidget(),
                addVerticalSpace(15),
                AppTextWidget(
                  text: "Movement",
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
                AppTextWidget(
                  text:
                      "Keep tabs on your daily steps and the distance you've covered",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: AppColor.textGrayColor,
                ),
                addVerticalSpace(10),
                InkWell(
                  onTap: () => Get.toNamed(Routes.WALKING_STEPS_CHART),
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 7,
                                color: Colors.grey.shade300,
                                offset: const Offset(0, 4))
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                            text: "Steps",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          const Divider(
                            color: Colors.black12,
                          ),
                          addVerticalSpace(3),
                          AppTextWidget(
                            text: "You have walked",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.textGrayColor,
                          ),
                          addVerticalSpace(10),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: "2389",
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: "Urbanist")),
                            TextSpan(
                                text: " Steps  ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontFamily: "Urbanist")),
                          ])),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      )),
                ),
                addVerticalSpace(10),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 7,
                              color: Colors.grey.shade300,
                              offset: const Offset(0, 4))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(
                          text: "Distance",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        const Divider(
                          color: Colors.black12,
                        ),
                        addVerticalSpace(3),
                        AppTextWidget(
                          text: "You have covered",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: AppColor.textGrayColor,
                        ),
                        addVerticalSpace(10),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: "3.4",
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: "Urbanist")),
                          TextSpan(
                              text: " km  ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: "Urbanist")),
                        ])),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class UserLastSyncBoxWidget extends StatelessWidget {
  const UserLastSyncBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 145,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF1BB089),
              Color(0xFF76E1A6),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
              title: AppTextWidget(
                text: "Anjali Sharma",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textColor: Colors.white,
              ),
              subtitle: InkWell(
                onTap: () {
                  Get.toNamed(Routes.TEST_STAGE_WISE);
                },
                child: AppTextWidget(
                  text: "Take Balance Test",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.white,
                ),
              ),
            ),
            const Divider(),
            addVerticalSpace(5),
            Row(
              children: [
                const ImageIcon(
                  AssetImage(
                    "assets/images/clock.png",
                  ),
                  size: 14,
                  color: AppColor.lightWhite,
                ),
                addHorizontalySpace(7),
                AppTextWidget(
                  fontSize: 12,
                  text: "Last Synced : 17th January 2024, 2:13 PM",
                  textColor: AppColor.lightWhite,
                )
              ],
            )
          ],
        ));
  }
}

class TotalWearTimeWidget extends StatelessWidget {
  const TotalWearTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  color: Colors.grey.shade300,
                  offset: const Offset(0, 4))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
              text: "Total Wear Time",
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            const Divider(
              color: Colors.black12,
            ),
            addVerticalSpace(3),
            AppTextWidget(
              text: "You wore the belt for",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textColor: AppColor.textGrayColor,
            ),
            addVerticalSpace(10),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "8",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "Urbanist")),
              TextSpan(
                  text: " hours  ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: "Urbanist")),
              TextSpan(
                  text: "32",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "Urbanist")),
              TextSpan(
                  text: " minutes",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: "Urbanist"))
            ])),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 35,
              width: Get.width,
              decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8)),
              child: const Row(
                children: [
                  HorizontalGraph(
                    width: 80,
                    isFirst: true,
                    color: Color(0xFF208766),
                  ),
                  HorizontalGraph(
                    width: 70,
                    color: Color(0xFF7AAD6C),
                  ),
                  HorizontalGraph(
                    width: 50,
                    color: Color(0xFF2BB589),
                  ),
                  HorizontalGraph(
                    width: 90,
                    color: Color(0xFFE398AD),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWithBulletWidget(
                  bulletColor: Color(0xFF208766),
                  title: "Walking",
                ),
                TextWithBulletWidget(
                  bulletColor: Color(0xFF7AAD6C),
                  title: "Sitting",
                ),
                TextWithBulletWidget(
                  bulletColor: Color(0xFF2BB589),
                  title: "Standing",
                ),
                TextWithBulletWidget(
                  bulletColor: Color(0xFFE398AD),
                  title: "Laying",
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}

class BalanceScoreWidget extends StatelessWidget {
  const BalanceScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  color: Colors.grey.shade300,
                  offset: const Offset(0, 4))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
              text: "Balance Score",
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            const Divider(
              color: Colors.black12,
            ),
            addVerticalSpace(3),
            AppTextWidget(
              text: "Your score is very low, start exercise for improvement",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textColor: AppColor.textGrayColor,
            ),
            addVerticalSpace(10),
            Container(
              height: 35,
              width: Get.width,
              decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8)),
              child: const Row(
                children: [
                  HorizontalGraph(
                    width: 80,
                    isFirst: true,
                    color: Color.fromARGB(255, 240, 99, 228),
                  ),
                  HorizontalGraph(width: 0, color: Colors.amber),
                  HorizontalGraph(
                    width: 0,
                    color: AppColor.mainColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWithBulletWidget(
                  bulletColor: Color.fromARGB(255, 240, 99, 228),
                  title: "Low",
                ),
                TextWithBulletWidget(
                  bulletColor: Colors.amber,
                  title: "Medium",
                ),
                TextWithBulletWidget(
                  bulletColor: AppColor.mainColor,
                  title: "High",
                ),
              ],
            ),
          ],
        ));
  }
}

class HorizontalGraph extends StatelessWidget {
  const HorizontalGraph({
    super.key,
    required this.width,
    required this.color,
    this.isFirst = false,
  });

  final double width;
  final Color color;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(6),
            topRight: const Radius.circular(6),
            bottomLeft: Radius.circular(isFirst ? 6 : 0),
            topLeft: Radius.circular(isFirst ? 6 : 0),
          )),
    );
  }
}

class TextWithBulletWidget extends StatelessWidget {
  const TextWithBulletWidget({
    super.key,
    required this.bulletColor,
    required this.title,
  });
  final Color bulletColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.rectangle, size: 12, color: bulletColor),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10),
        )
      ],
    );
  }
}

class MultipleProgessIndicator extends StatelessWidget {
  const MultipleProgessIndicator({
    super.key,
    this.firstIndicatorValue = 0.8,
    this.secondIndicatorValue = 0.7,
    this.thirdIndicatorValue = 0.65,
    this.fourthIndicatorValue = 0.55,
  });
  final double firstIndicatorValue;
  final double secondIndicatorValue;
  final double thirdIndicatorValue;
  final double fourthIndicatorValue;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      CircularProgressIndicator(
        semanticsValue: "First",
        strokeAlign: 25,
        color: const Color(0xFFC5FAC8),
        value: firstIndicatorValue,
      ),
      CircularProgressIndicator(
        semanticsValue: "test",
        strokeAlign: 20,
        color: const Color(0xFFFAEAC5),
        value: secondIndicatorValue,
      ),
      CircularProgressIndicator(
        semanticsValue: "test",
        strokeAlign: 15,
        color: const Color(0xFFC6D6FA),
        value: thirdIndicatorValue,
      ),
      CircularProgressIndicator(
        semanticsValue: "test",
        strokeAlign: 10,
        color: const Color(0xFFFAC5DB),
        value: fourthIndicatorValue,
      )
    ]);
  }
}

class HourlyProgressGridBoxWidget extends StatelessWidget {
  const HourlyProgressGridBoxWidget({
    super.key,
    required this.iconUrl,
    required this.bgColor,
    required this.title,
  });
  final String iconUrl;
  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      width: 156,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextWidget(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          const Divider(
            color: Colors.black12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "8",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: "Urbanist")),
                TextSpan(
                    text: " hour\n",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: "Urbanist")),
                TextSpan(
                    text: "32",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: "Urbanist")),
                TextSpan(
                    text: " minutes",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: "Urbanist"))
              ])),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Image.asset(
                  iconUrl,
                  height: 34,
                  width: 29,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
