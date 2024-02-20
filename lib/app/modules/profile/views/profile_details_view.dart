import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/app/widget/custom_tetxt_field.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/profile_controller.dart';

class ProfileDetailsView extends GetView<ProfileController> {
  const ProfileDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          backgroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.grey,
          titleSpacing: 0,
          title: const Text(
            'Ripple Healthcare',
            style: TextStyle(fontSize: 18),
          ),
        ),
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
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              addVerticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColor.mainColor,
                    backgroundImage: AssetImage("assets/images/person.png"),
                  ),
                ],
              ),
              addVerticalSpace(25),
              AppTextWidget(
                text: "Name",
                textColor: AppColor.textGrayColor,
              ),
              addVerticalSpace(6),
              CustomTextField(
                hintText: "Anjali Sharma",
                readOnly: true,
              ),
              addVerticalSpace(15),
              AppTextWidget(
                text: "Phone Numbers",
                textColor: AppColor.textGrayColor,
              ),
              addVerticalSpace(6),
              CustomTextField(
                hintText: "+91 000000000",
                readOnly: true,
              ),
              addVerticalSpace(15),
              AppTextWidget(
                text: "Email Address",
                textColor: AppColor.textGrayColor,
              ),
              addVerticalSpace(6),
              CustomTextField(
                hintText: "anjalisharma@gmail.com",
                readOnly: true,
              )
            ],
          ),
        ));
  }
}
