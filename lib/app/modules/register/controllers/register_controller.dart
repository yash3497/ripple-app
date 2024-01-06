import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  RxBool tempBool = true.obs;

  bool isAgeSelectView = false;

  int selectedGender = 0;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  final TextEditingController fistNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  List genderList = ['Male', "Female", "Others"];

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
}
