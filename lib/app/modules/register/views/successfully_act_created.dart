import 'package:flutter/material.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';

class SuccessFullAccountCreated extends StatelessWidget {
  const SuccessFullAccountCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/successImg.png',
            height: 150,
            width: 150,
            color: AppColor.mainColor,
          ),
          AppTextWidget(
            text: "Account Created!",
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
          AppTextWidget(
            text:
                "Congratulations for becoming the part of ripple helthcare community",
            textAlign: TextAlign.center,
            textColor: AppColor.textGrayColor,
          )
        ],
      ),
    );
  }
}
