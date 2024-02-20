import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommanAppbar(notificationHide: true),
        body: CustomGradientBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
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
                addVerticalSpace(20),
                Expanded(
                  child: ListView.separated(
                    itemCount: 20,
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
                              text: "It’s time for your Sugar Medicine",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            subtitle: const Text(
                              "1 hour ago",
                              style: TextStyle(fontSize: 10),
                            ),
                            trailing: Image.asset(
                              "assets/images/medicineBottle.png",
                              width: 50,
                            )),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return addVerticalSpace(15);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
