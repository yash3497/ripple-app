import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';

import '../controllers/hip_pro_bluetooth_flow_controller.dart';

class HipProBluetoothFlowView extends GetView<HipProBluetoothFlowController> {
  const HipProBluetoothFlowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HipProBluetoothFlowController>(initState: (state) {
      Future.delayed(Duration(seconds: 1), () {
        Get.toNamed(Routes.BLUETOOTH_CONNECT_PROCESS);
      });
    }, builder: (ct) {
      return Scaffold(
          body: Column(
        children: [
          Spacer(),
          Container(
            height: Get.height * 0.83,
            width: Get.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Ellipse.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/images/roundedCycle.png")],
              ),
            ),
          )
        ],
      ));
    });
  }
}
