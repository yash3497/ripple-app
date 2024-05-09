import 'package:flutter/material.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

Future<T?> quitDialog<T>(BuildContext context, Function() exit) {
  return showDialog(
      context: (context),
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: AppTextWidget(
            text: "Do you want to quit?",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          content: AppTextWidget(
            text: "All progress in this session will be lost.",
            fontSize: 16,
            fontWeight: FontWeight.w400,
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
                    onPressed: exit,
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
