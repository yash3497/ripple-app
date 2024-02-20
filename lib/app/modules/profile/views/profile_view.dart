import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/profile/views/profile_details_view.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/app/widget/log_out_dialog.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
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
            children: [
              CustomBackButton(),
              addVerticalSpace(25),
              InkWell(
                onTap: () => Get.to(() => ProfileDetailsView()),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColor.mainColor,
                      backgroundImage: AssetImage("assets/images/person.png"),
                    ),
                    addHorizontalySpace(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(
                          text: "Anjali Sharma",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          textColor: AppColor.black,
                        ),
                        AppTextWidget(
                          text: "anjalisharma@gmail.com",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              addVerticalSpace(25),
              ListTile(
                title: AppTextWidget(
                  text: "Contact Us",
                  fontSize: 18,
                ),
                trailing: const ImageIcon(
                  AssetImage("assets/images/call.png"),
                  color: AppColor.mainColor,
                  size: 20,
                ),
              ),
              const Divider(
                height: 0,
              ),
              ListTile(
                title: AppTextWidget(
                  text: "Help and Support",
                  fontSize: 18,
                ),
                trailing: const ImageIcon(
                  AssetImage("assets/images/help.png"),
                  color: AppColor.mainColor,
                  size: 20,
                ),
              ),
              const Divider(
                height: 0,
              ),
              ListTile(
                title: AppTextWidget(
                  text: "Privacy Policy",
                  fontSize: 18,
                ),
                trailing: const ImageIcon(
                  AssetImage("assets/images/policy.png"),
                  color: AppColor.mainColor,
                  size: 20,
                ),
              ),
              const Divider(
                height: 0,
              ),
              ListTile(
                title: AppTextWidget(
                  text: "Terms and Conditions",
                  fontSize: 18,
                ),
                trailing: const ImageIcon(
                  AssetImage("assets/images/t&c.png"),
                  color: AppColor.mainColor,
                  size: 20,
                ),
              ),
              const Divider(
                height: 0,
              ),
              Spacer(),
              TextButton(
                  onPressed: () {
                    logoutDialog(context, "Hip Pro+");
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.error),
                  )),
              addVerticalSpace(15)
            ],
          ),
        ));
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
