import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/services/storage_service.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

Future<T?> logoutDialog<T>(BuildContext context, String title) {
  return showDialog(
      context: (context),
      builder: (context) {
        return AlertDialog(
          title: AppTextWidget(
            text: "Do you want to exit $title?",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          actions: [
            Row(
              children: [
                Flexible(
                  child: AppButton(
                    btnHeight: 40,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    buttonText: "Cancel",
                    bgColor: Color(0xFF7E8199),
                  ),
                ),
                addHorizontalySpace(10),
                Flexible(
                  child: AppButton(
                    btnHeight: 40,
                    onPressed: () {
                      Navigator.pop(context);
                      StorageService().clear();
                      Get.offNamedUntil(Routes.LOG_IN, (route) => true);
                    },
                    buttonText: "Exit",
                    bgColor: Color(0xFFF0594F),
                  ),
                )
              ],
            ),
          ],
        );
      });
}
