import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ripple Health',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const ImageIcon(AssetImage("assets/images/bell.png")))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "What brings you\n",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                TextSpan(
                    text: "to Ripple Health?",
                    style: TextStyle(fontSize: 28, color: Colors.black))
              ])),
              addVerticalSpace(30),
              InkWell(
                onTap: () {
                  Get.to(() => BottomNavigationBarView());
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFDBDCFF),
                        Color(0xFFC2B4E6),
                        Color(0xFFAA99D8)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextWidget(
                        text: "Hip Pro +",
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        textColor: AppColor.primaryColor,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextWidget(
                              text:
                                  "Guarding every step,belted protection for Golden Years",
                            ),
                          ),
                          Image.asset(
                            "assets/images/hipProHome.png",
                            height: 54,
                            width: 54,
                          ),
                          addHorizontalySpace(20)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              addVerticalSpace(20),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFFE2D8),
                        Color(0xFFFFB6B3),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextWidget(
                        text: "Steady Steps",
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        textColor: Color(0xFFFC847A),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextWidget(
                              text: "Empowering Elders, One Step at a Time",
                            ),
                          ),
                          addHorizontalySpace(40),
                          Image.asset(
                            "assets/images/stedySteps.png",
                            height: 54,
                            width: 54,
                          ),
                          addHorizontalySpace(20)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
