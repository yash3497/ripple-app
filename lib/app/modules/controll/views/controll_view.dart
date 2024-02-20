import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/controll/views/emergency_contact_list.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/app/widget/common_appbar.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/controll_controller.dart';

class ControllView extends GetView<ControllController> {
  const ControllView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextWidget(
            text: "Controls",
            fontSize: 28,
            fontWeight: FontWeight.w500,
            textColor: AppColor.textGreenColor,
          ),
          AppTextWidget(
            text: "Simplifying interaction at your command",
            fontSize: 16,
            // fontWeight: FontWeight.w500,
            // textColor: AppColor.textGreenColor,
          ),
          addVerticalSpace(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 35,
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.greenColor),
            child: Row(
              children: [
                AppTextWidget(
                  text: "Last Synced ",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor: AppColor.white,
                ),
                Spacer(),
                AppTextWidget(
                  text: "12:16 AM",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textColor: AppColor.white,
                ),
              ],
            ),
          ),
          addVerticalSpace(25),
          Obx(
            () => Row(
              children: [
                Flexible(
                  child: ControlsCatCardWidget(
                    img: "inflation.png",
                    subTitle: "Trigger Inflation when you sense instability.",
                    title: "Inflation",
                    color: controller.isInflation.value
                        ? Color(0xFF192A53)
                        : Colors.white,
                    isThemeChange: controller.isInflation.value,
                    onTap: () {
                      controller.isInflation.toggle();
                    },
                  ),
                ),
                addHorizontalySpace(10),
                Flexible(
                  child: ControlsCatCardWidget(
                    img: "sos.png",
                    subTitle: "Alert your loved ones with a click.",
                    title: "SOS",
                    color: controller.isSos.value
                        ? Color(0xFFF0594F)
                        : Colors.white,
                    isThemeChange: controller.isSos.value,
                    onTap: () {
                      controller.isSos.toggle();
                    },
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(15),
          Obx(
            () => Row(
              children: [
                Flexible(
                  child: ControlsCatCardWidget(
                    img: "flashlight.png",
                    subTitle: "Toggle the flashlight on and off with a click.",
                    title: "Flashlight",
                    color: controller.isFlash.value
                        ? Color(0xFFFFA012)
                        : Colors.white,
                    isThemeChange: controller.isFlash.value,
                    onTap: () {
                      controller.isFlash.toggle();
                    },
                  ),
                ),
                addHorizontalySpace(10),
                Flexible(
                  child: ControlsCatCardWidget(
                    img: "battery.png",
                    subTitle: "45% charged",
                    title: "Battery",
                    color: controller.isBattery.value
                        ? Color(0xFF2BB589)
                        : Colors.white,
                    isThemeChange: controller.isBattery.value,
                    onTap: () {
                      controller.isBattery.toggle();
                    },
                  ),
                ),
              ],
            ),
          ),
          addVerticalSpace(20),
          ControlsCatCardWidget(
              img: "contact.png",
              title: "Emergency Contacts",
              subTitle: "Add emergency contacts to your list.",
              color: Colors.white,
              onTap: () {
                Get.to(() => EmeregencyConatctListView());
              },
              isThemeChange: false)
        ],
      ),
    ));
  }
}

class ControlsCatCardWidget extends StatelessWidget {
  const ControlsCatCardWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.color,
      required this.onTap,
      required this.isThemeChange});
  final String img;
  final String title;
  final String subTitle;
  final Color color;
  final VoidCallback onTap;
  final bool isThemeChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: Get.height * 0.14,
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color,
              boxShadow: [
                BoxShadow(
                    blurRadius: 7,
                    color: Colors.grey.shade300,
                    offset: const Offset(0, 4))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppTextWidget(
                    text: title,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textColor: isThemeChange ? Colors.white : Colors.black,
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/$img",
                    height: 25,
                    color: (isThemeChange) ? Colors.white : null,
                  )
                ],
              ),
              Divider(
                color: isThemeChange ? Colors.white : Colors.black12,
              ),
              addVerticalSpace(3),
              AppTextWidget(
                text: subTitle,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                textColor:
                    isThemeChange ? Colors.white : AppColor.textGrayColor,
              ),
            ],
          )),
    );
  }
}
