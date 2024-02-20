import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/medication/bindings/medication_binding.dart';
import 'package:ripple_healthcare/app/modules/medication/views/add_medication_view.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/medication_controller.dart';

class MedicationView extends GetView<MedicationController> {
  const MedicationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddMedicationView(), binding: MedicationBinding());
          },
          backgroundColor: AppColor.greenColor,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: "Your Medications",
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
                AppTextWidget(
                  text: "Nurturing wellness with heartfelt reminders",
                  fontSize: 20,
                  // fontWeight: FontWeight.w600,
                ),
                addVerticalSpace(20),
                CalendarSliderWidget(controller: controller),
                addVerticalSpace(10),
                AppTextWidget(
                  text: "You have to take",
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                addVerticalSpace(10),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.grey.shade400,
                                  offset: const Offset(0, 2))
                            ]),
                        child: ListTile(
                          title: AppTextWidget(
                            text: "Sugar",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          subtitle: const Text("Tablet"),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppTextWidget(
                                text: "9:00 AM",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child:
                                      const Icon(Icons.delete_outline_rounded)),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return addVerticalSpace(15);
                    },
                    itemCount: 2)
              ],
            ),
          ),
        ));
  }
}

class CalendarSliderWidget extends StatelessWidget {
  const CalendarSliderWidget({
    super.key,
    required this.controller,
  });

  final MedicationController controller;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: controller.calendarList.length,
      // carouselController: widget.controller.carouselController,
      options: CarouselOptions(
          height: Get.height * 0.16,
          enlargeCenterPage: true,
          autoPlay: false,
          aspectRatio: 16 / 9,
          onPageChanged: (index, reason) {},
          autoPlayCurve: Curves.easeInOut,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.3,
          enlargeFactor: 0.3),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.24,
            margin: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey.shade400,
                  )
                ]),
            child: Column(
              children: [
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    color: AppColor.greenColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                ),
                AppTextWidget(
                  text: controller.calendarList[index]["digit"],
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                AppTextWidget(
                  text: controller.calendarList[index]["date"],
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
