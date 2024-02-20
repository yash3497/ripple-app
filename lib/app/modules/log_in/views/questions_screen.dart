import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/log_in/controllers/log_in_controller.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class QuestionsScreen extends GetView<LogInController> {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Get.width * 0.3,
        leading: Row(
          children: [
            addHorizontalySpace(15),
            Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
            ),
            addHorizontalySpace(6),
            AppTextWidget(
              text: "Back",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textColor: AppColor.textGreenColor,
            ),
          ],
        ),
      ),
      body: GetBuilder<LogInController>(builder: (ct) {
        PageController _pageController = PageController();
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      controller.indicator = value;
                      controller.update();
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.questionsList.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextWidget(
                            text:
                                controller.questionsList[index].questions ?? "",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.textGreenColor,
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(10),
                            height: Get.width * 0.55,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: AppColor.lightBgColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextWidget(
                                  text: "Know the reason",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  textColor: Color(0xFF1B4852),
                                ),
                                addVerticalSpace(8),
                                AppTextWidget(
                                  text:
                                      controller.questionsList[index].reason ??
                                          "",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  textColor: Color(0xFF1B4852),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
              addVerticalSpace(15),
              Container(
                padding: EdgeInsets.only(left: Get.width * 0.25),
                height: 12,
                child: ListView.builder(
                    itemCount: controller.questionsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      return Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 4),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: controller.indicator == i
                                    ? AppColor.mainColor
                                    : AppColor.textGreenColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      );
                    }),
              ),
              addVerticalSpace(15),
              AppButton(
                  onPressed: () {
                    // if (controller.indicator <
                    //     controller.questionsList.length - 1) {
                    // Move to the next question
                    _pageController.animateToPage(controller.indicator + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                    controller.indicator++;
                    controller.update(); // Update the UI
                    // }
                    if (controller.indicator >
                        controller.questionsList.length - 1) {
                      Get.to(() => BodyPartScreen());
                    }
                  },
                  buttonText: "Yes"),
              addVerticalSpace(15),
              AppButton(
                  onPressed: () {
                    // if (controller.indicator <
                    //     controller.questionsList.length - 1) {
                    // Move to the next question
                    _pageController.animateToPage(controller.indicator + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                    controller.indicator++;
                    controller.update(); // Update the UI
                    // }
                    if (controller.indicator >
                        controller.questionsList.length - 1) {
                      Get.to(() => BodyPartScreen());
                    }
                  },
                  buttonText: "No"),
              addVerticalSpace(20),
            ],
          ),
        );
      }),
    );
  }
}

class BodyPartScreen extends GetView<LogInController> {
  const BodyPartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Get.width * 0.3,
        leading: Row(
          children: [
            addHorizontalySpace(15),
            Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
            ),
            addHorizontalySpace(6),
            AppTextWidget(
              text: "Back",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textColor: AppColor.textGreenColor,
            ),
          ],
        ),
      ),
      body: GetBuilder<LogInController>(builder: (ct) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextWidget(
                text:
                    "Please tap on any body parts where you experienced pain.",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              addVerticalSpace(30),
              Stack(
                children: [
                  Image.asset("assets/images/body.png"),
                  Positioned(
                    right: Get.width * 0.28,
                    top: 12,
                    child: BulletAndTextWidget(
                      title: "Head",
                      isSelected: controller.head,
                      onTap: () {
                        controller.head = !controller.head;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    right: Get.width * 0.16,
                    top: Get.height * 0.1,
                    child: BulletAndTextWidget(
                      title: "Shoulder",
                      isSelected: controller.shoulder,
                      onTap: () {
                        controller.shoulder = !controller.shoulder;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    right: Get.width * 0.17,
                    top: Get.height * 0.19,
                    child: BulletAndTextWidget(
                      title: "Elbow",
                      isSelected: controller.elbow,
                      onTap: () {
                        controller.elbow = !controller.elbow;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    right: Get.width * 0.06,
                    top: Get.height * 0.26,
                    child: BulletAndTextWidget(
                      title: "Wrist/Hand",
                      isSelected: controller.wrist,
                      onTap: () {
                        controller.wrist = !controller.wrist;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    right: Get.width * 0.24,
                    top: Get.height * 0.33,
                    child: BulletAndTextWidget(
                      title: "Thigh",
                      isSelected: controller.thigh,
                      onTap: () {
                        controller.thigh = !controller.thigh;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    right: Get.width * 0.25,
                    bottom: Get.height * 0.1,
                    child: BulletAndTextWidget(
                      title: "Shin",
                      isSelected: controller.shin,
                      onTap: () {
                        controller.shin = !controller.shin;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    right: Get.width * 0.23,
                    bottom: Get.height * 0.03,
                    child: BulletAndTextWidget(
                      title: "Ankle",
                      isSelected: controller.ankle,
                      onTap: () {
                        controller.ankle = !controller.ankle;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    left: Get.width * 0.24,
                    bottom: Get.height * 0.02,
                    child: BulletAndTextWidgetLeft(
                      title: "Foot",
                      isSelected: controller.foot,
                      onTap: () {
                        controller.foot = !controller.foot;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    left: Get.width * 0.24,
                    bottom: Get.height * 0.14,
                    child: BulletAndTextWidgetLeft(
                      title: "Knee",
                      isSelected: controller.knee,
                      onTap: () {
                        controller.knee = !controller.knee;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    left: Get.width * 0.26,
                    bottom: Get.height * 0.23,
                    child: BulletAndTextWidgetLeft(
                      title: "Hip",
                      isSelected: controller.hip,
                      onTap: () {
                        controller.hip = !controller.hip;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    left: Get.width * 0.19,
                    bottom: Get.height * 0.29,
                    child: BulletAndTextWidgetLeft(
                      title: "Stomach",
                      isSelected: controller.stomach,
                      onTap: () {
                        controller.stomach = !controller.stomach;
                        controller.update();
                      },
                    ),
                  ),
                  Positioned(
                    left: Get.width * 0.22,
                    top: Get.height * 0.12,
                    child: BulletAndTextWidgetLeft(
                      title: "Chest",
                      isSelected: controller.chest,
                      onTap: () {
                        controller.chest = !controller.chest;
                        controller.update();
                      },
                    ),
                  ),
                ],
              ),
              Spacer(),
              AppButton(
                  onPressed: () {
                    Get.toNamed(Routes.HOME);
                  },
                  buttonText: "Done"),
              addVerticalSpace(15),
            ],
          ),
        );
      }),
    );
  }
}

class BulletAndTextWidget extends StatelessWidget {
  const BulletAndTextWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
  });
  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 15,
            color: isSelected ? Color(0xFFF0594F) : Color(0xFF13B3C2),
          ),
          addHorizontalySpace(6),
          AppTextWidget(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            textColor: Color(0xFF074247),
          )
        ],
      ),
    );
  }
}

class BulletAndTextWidgetLeft extends StatelessWidget {
  const BulletAndTextWidgetLeft({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
  });
  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          AppTextWidget(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            textColor: Color(0xFF074247),
          ),
          addHorizontalySpace(6),
          Icon(
            Icons.circle,
            size: 15,
            color: isSelected ? Color(0xFFF0594F) : Color(0xFF13B3C2),
          ),
        ],
      ),
    );
  }
}
