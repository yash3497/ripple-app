import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/controll/controllers/controll_controller.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class EmeregencyConatctListView extends GetView<ControllController> {
  const EmeregencyConatctListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel"))
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AppButton(
          onPressed: () {},
          buttonText: "Add New",
          bgColor: AppColor.greenColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextWidget(
                text: "Your List",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              addVerticalSpace(10),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Anjali sharma"),
                      subtitle: Text("+91 0000000000"),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_outline_rounded)),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 2)
            ],
          ),
        ),
      ),
    );
  }
}
