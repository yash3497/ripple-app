import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            Get.back();
          },
      child: Container(
        margin: EdgeInsets.only(left: 12, top: 5, bottom: 5),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.borderColor)),
        child: const Center(
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }
}
