import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/hip_pro_bluetooth_flow/controllers/hip_pro_bluetooth_flow_controller.dart';
import 'package:ripple_healthcare/app/modules/home/views/bottom_navigation_bar.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/app/widget/log_out_dialog.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class BluetoothConnectProccessView
    extends GetView<HipProBluetoothFlowController> {
  const BluetoothConnectProccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.blueToothStatus = 0;
        Get.until((route) => route.settings.name == Routes.HOME);
        controller.update();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              logoutDialog(context, "Hip Pro+");
            },
            icon: const ImageIcon(AssetImage("assets/images/logoutIcon.png")),
          ),
          titleSpacing: 0,
          title: AppTextWidget(
            text: "Hip Pro*",
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: GetBuilder<HipProBluetoothFlowController>(builder: (ct) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(Get.height * 0.05),
                AppTextWidget(
                  text: controller.blueToothStatus == 4
                      ? "Connected"
                      : "Connect Your Hip Pro+",
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  textColor: Color(0xFF18634C),
                ),
                addVerticalSpace(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/Bluetooth.png",
                        height: 100,
                      ),
                    ),
                    if (controller.blueToothStatus == 3)
                      SizedBox(
                        height: 10,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctc, i) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 3),
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                        color: i == 0
                                            ? AppColor.greenColor
                                            : Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ],
                              );
                            }),
                      ),
                    addHorizontalySpace(20),
                    if (controller.blueToothStatus == 3 ||
                        controller.blueToothStatus == 4)
                      Center(
                        child: Image.asset(
                          "assets/images/belt.png",
                          height: 80,
                        ),
                      ),
                  ],
                ),
                addVerticalSpace(30),
                Center(
                  child: AppTextWidget(
                    text: controller.blueToothStatus == 0
                        ? "Please ensure Bluetooth is enabled on your device to seamlessly utilize the app if not click on Turn On the bluetooth."
                        : controller.blueToothStatus == 1
                            ? "Turning On the Bluetooth"
                            : controller.blueToothStatus == 2
                                ? "Click on Connect Hip Pro+ button to connect your device to the app."
                                : controller.blueToothStatus == 3
                                    ? "Connecting......"
                                    : "Your Belt is now connected with your device.",
                    fontSize: 20,
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                if (controller.blueToothStatus < 2)
                  AppButton(
                    onPressed: () {
                      controller.blueToothStatus = 1;
                      Future.delayed(Duration(seconds: 2), () {
                        controller.blueToothStatus = 2;
                        controller.update();
                      });
                      controller.update();
                    },
                    buttonText: "Turn On Bluetooth",
                    bgColor: controller.blueToothStatus == 1
                        ? AppColor.disableGreenColor
                        : AppColor.greenColor,
                  ),
                addVerticalSpace(15),
                if (controller.blueToothStatus < 4)
                  AppButton(
                    onPressed: () {
                      controller.blueToothStatus = 3;
                      controller.update();
                      Future.delayed(Duration(seconds: 2), () {
                        controller.blueToothStatus = 4;
                        controller.update();
                      });
                    },
                    buttonText: "Connect Hip Pro+",
                    bgColor: (controller.blueToothStatus == 1 ||
                            controller.blueToothStatus == 3)
                        ? AppColor.disableGreenColor
                        : AppColor.buttonLightColor,
                    txtcolor: (controller.blueToothStatus == 1 ||
                            controller.blueToothStatus == 3)
                        ? Colors.white
                        : AppColor.greenColor,
                  ),
                if (controller.blueToothStatus == 4)
                  AppButton(
                    onPressed: () {
                      Get.to(() => BottomNavigationBarView());
                    },
                    buttonText: "Get Started",
                    bgColor: AppColor.greenColor,
                  ),
                addVerticalSpace(20),
              ],
            ),
          );
        }),
      ),
    );
  }
}
