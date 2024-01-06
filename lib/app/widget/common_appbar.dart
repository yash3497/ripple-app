import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';

import '../../utils/constant_variable.dart';
import 'app_text_widget.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double preferredHeight;
  final Color forGroundColor;
  final Color bgColor;
  final Widget bottomWidget;
  final List<Widget>? action;
  const CommonAppbar({
    super.key,
    required this.title,
    this.preferredHeight = 50,
    this.forGroundColor = Colors.white,
    this.bgColor = AppColor.white,
    this.bottomWidget = const SizedBox(),
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: bgColor,
        foregroundColor: forGroundColor,
        actions: action,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            addHorizontalySpace(10),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColor.lightWhite.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                )),
              ),
            )
          ],
        ),
        // ElevatedButton(onPressed: () {}, child: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: AppTextWidget(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        bottom:
            PreferredSize(child: bottomWidget, preferredSize: preferredSize));
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
