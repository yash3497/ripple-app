import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppTextWidget(
                  text: "Hello Sumit!",
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/person.png"),
                )
              ],
            ),
            addVerticalSpace(20),
            AppTextWidget(
              text: "Today’s Summary",
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
            addVerticalSpace(20),
            const TotalWearTimeWidget(),
            addVerticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HourlyProgressGridBoxWidget(
                  iconUrl: "assets/images/walking.png",
                  bgColor: const Color(0xFFC5FAC8),
                  title: "Walking Time",
                ),
                HourlyProgressGridBoxWidget(
                  iconUrl: "assets/images/standing.png",
                  bgColor: const Color(0xFFFAEAC5),
                  title: "Standing Time",
                ),
              ],
            ),
            addVerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HourlyProgressGridBoxWidget(
                  iconUrl: "assets/images/walking.png",
                  bgColor: const Color(0xFFFAC5DB),
                  title: "Sitting Time",
                ),
                HourlyProgressGridBoxWidget(
                  iconUrl: "assets/images/walking.png",
                  bgColor: const Color(0xFFC6D6FA),
                  title: "Laying Time",
                ),
              ],
            ),
          ],
        ),
      ),
    ));
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
      padding: EdgeInsets.all(8),
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
          Divider(
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
            const Text(
              "Total Wear Time",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Urbanist"),
            ),
            const Divider(
              color: Colors.black12,
            ),
            addVerticalSpace(10),
            Row(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: const MultipleProgessIndicator()),
                addHorizontalySpace(15),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "8",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: "Urbanist")),
                  TextSpan(
                      text: " hour\n",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: "Urbanist")),
                  TextSpan(
                      text: "32",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: "Urbanist")),
                  TextSpan(
                      text: " minutes",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: "Urbanist"))
                ]))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWithBulletWidget(
                      bulletColor: Color(0xFFC5FAC8),
                      title: "Walking time",
                    ),
                    addVerticalSpace(5),
                    const TextWithBulletWidget(
                      bulletColor: Color(0xFFC6D6FA),
                      title: "Sitting time",
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWithBulletWidget(
                      bulletColor: Color(0xFFFAEAC5),
                      title: "Standing time",
                    ),
                    addVerticalSpace(5),
                    const TextWithBulletWidget(
                      bulletColor: Color(0xFFFAC5DB),
                      title: "Laying time",
                    ),
                  ],
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
        Icon(Icons.circle, size: 15, color: bulletColor),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
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
