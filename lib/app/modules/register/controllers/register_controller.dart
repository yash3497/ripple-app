import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/log_in/controllers/log_in_controller.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/services/http_services.dart';
import 'package:ripple_healthcare/utils/api_constants.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  RxBool tempBool = true.obs;

  bool isAgeSelectView = false;

  int selectedGender = 0;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  final TextEditingController fistNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  List genderList = [
    'Male',
    "Female",
  ];

  List trainingExp = [
    {
      "title": "Walking or movement issues?",
      'desc':
          "Lorem ipsum dolor sit amet, consectetur adipscing elit. Ut vel odio en urna ultrice...",
      "isSelected": false,
    },
    {
      "title": "Are you on medications?",
      'desc':
          "Lorem ipsum dolor sit amet, consectetur adipscing elit. Ut vel odio en urna ultrice...",
      "isSelected": false,
    },
    {
      "title": "Blood pressure dropping?",
      'desc':
          "Lorem ipsum dolor sit amet, consectetur adipscing elit. Ut vel odio en urna ultrice...",
      "isSelected": false,
    },
    {
      "title": "Have vision problem?",
      'desc':
          "Lorem ipsum dolor sit amet, consectetur adipscing elit. Ut vel odio en urna ultrice...",
      "isSelected": false,
    },
    {
      "title": "Have you fallen in last 12 months?",
      'desc':
          "Lorem ipsum dolor sit amet, consectetur adipscing elit. Ut vel odio en urna ultrice...",
      "isSelected": false,
    },
    {
      "title": "Any feet related issues?",
      'desc':
          "Lorem ipsum dolor sit amet, consectetur adipscing elit. Ut vel odio en urna ultrice...",
      "isSelected": false,
    },
    {
      "title": "Do you feel dizziness? ",
      'desc':
          "Lorem ipsum dolor sit amet, consectetur adipscing elit. Ut vel odio en urna ultrice...",
      "isSelected": false,
    },
    {
      "title": "Hard to balance routine activities?",
      'desc':
          "Lorem ipsum dolor sit amet, consectetur adipscing elit. Ut vel odio en urna ultrice...",
      "isSelected": false,
    },
    {
      "title": "Difficult to remember recent task?",
      'desc':
          "Lorem ipsum dolor sit amet, consectetur adipscing elit. Ut vel odio en urna ultrice...",
      "isSelected": false,
    },
  ];

  registerUser() async {
    try {
      Map body = {
        "lastName": lastNameController.text,
        "phoneNo":
            int.parse(Get.find<LogInController>().phoneNumberController.text),
        "pastProblems": trainingExp
            .where((element) => element['isSelected'] == true)
            .map((e) => e['title'])
            .toList(),
        "firstName": fistNameController.text,
        "gender": genderList[selectedGender],
        "age": int.parse(ageController.text),
      };
      var response =
          await HttpServices.post(ApiConstants.register, jsonEncode(body));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Registration Successful');
        Get.offAllNamed(Routes.SUCCESS_VIEW);
      } else {
        Fluttertoast.showToast(msg: 'Something went wrong');
      }
    } catch (e) {
      print('Register Error: $e');
    }
  }
}
