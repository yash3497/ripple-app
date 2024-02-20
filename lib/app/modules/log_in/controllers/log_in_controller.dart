import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/services/http_services.dart';
import 'package:ripple_healthcare/services/storage_service.dart';
import 'package:ripple_healthcare/utils/api_constants.dart';
import 'package:ripple_healthcare/utils/db_keys.dart';

class LogInController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();
  String otpSessionId = '';
  int seconds = 30;
  late Timer _timer;
  int indicator = 0;
  bool head = false;
  bool shoulder = false;
  bool elbow = false;
  bool wrist = false;
  bool thigh = false;
  bool shin = false;
  bool ankle = false;
  bool foot = false;
  bool knee = false;
  bool hip = false;
  bool stomach = false;
  bool chest = false;

  updateTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds > 0) {
          seconds--;
          update();
        } else {
          _timer.cancel(); // Stop the timer when time reaches 0
        }
      },
    );
  }

  sendOtp() async {
    try {
      // var response = await HttpServices.get(
      //     '${ApiConstants.twoFactorUrl}/+91${phoneNumberController.text}/AUTOGEN3');
      // if (response.statusCode == 200) {
      //   var data = jsonDecode(response.body);
      //   otpSessionId = data['Details'];
      //   Fluttertoast.showToast(msg: "OTP Sent Successfully");
      //   Get.toNamed(Routes.OTP_VERIFY);
      // } else {
      //   print('Failed to generate OTP');
      //   Fluttertoast.showToast(msg: 'Network Error');
      // }
      Get.toNamed(Routes.OTP_VERIFY);
    } catch (e) {
      print("Error in sending OTP $e");
    }
  }

  verifyOtp() async {
    try {
      var response = await HttpServices.get(
          '${ApiConstants.verifyOtp}/$otpSessionId/${otpController.text}');
      if (response.statusCode == 200) {
        login();
      }
    } catch (e) {
      print("Error in verifying OTP $e");
    }
  }

  resendOtp() async {
    seconds = 30;
    updateTimer();
    sendOtp();
  }

  login() async {
    try {
      Map body = {
        'phoneNo': int.parse(phoneNumberController.text),
      };
      var response =
          await HttpServices.post(ApiConstants.login, jsonEncode(body));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        StorageService().write(DbKeys.token, data['token']);
        Get.toNamed(Routes.HOME);
      } else if (response.statusCode == 404) {
        Fluttertoast.showToast(msg: 'Please create an account.');
        Get.toNamed(Routes.REGISTER);
      } else {
        Fluttertoast.showToast(msg: 'Something went wrong!');
        print('Login Failed ${response.statusCode}');
      }
    } catch (e) {
      print("Login error : $e");
    }
  }

  // Qquestion After Login:
  List<QuestionsModel> questionsList = [
    QuestionsModel(
        id: 1,
        questions: "I take medicine to help me sleep or improve my mood.",
        reason:
            "These medicines can sometimes increase your chance of falling."),
    QuestionsModel(
      id: 2,
      questions: "I have fallen in the past years.",
      reason: "People who have fallen once are likely to fall again.",
    ),
    QuestionsModel(
      id: 3,
      questions: "Sometimes I feel unsteady when I am walking.",
      reason:
          "Unsteadiness or needing support while walking are signs of poor balance.",
    ),
    QuestionsModel(
      id: 4,
      questions:
          "I steady myself by holding onto furniture when walking at home.",
      reason: "This is a sign of poor balance.",
    ),
    QuestionsModel(
      id: 5,
      questions: "I often have to rush to the toilet.",
      reason:
          "Rushing to the bathroom, especially at night, increases your chance of falling.",
    ),
    QuestionsModel(
      id: 6,
      questions: "I have lost some feeling in my feet.",
      reason: "Numbness in your feet can acuse stumbles and lead to falls.",
    ),
    QuestionsModel(
      id: 7,
      questions:
          "I take medicine that sometimes makes me feel light-headed or more tired than usual.",
      reason:
          "Side effects from medicines can sometimes increase your chance of falling.",
    ),
    QuestionsModel(
      id: 8,
      questions: "I take medicine to help me sleep or improve my mood.",
      reason: "These medicines can sometimes increase your chance of falling.",
    ),
    QuestionsModel(
      id: 9,
      questions: "I often feel sad and depressed.",
      reason:
          "Symptoms of depression, such as not feeling well or feeling slowed down, are linked to falls.",
    ),
    QuestionsModel(
      id: 10,
      questions:
          "Do you feel confident you will not fall moving around your house?",
      reason:
          "The first step in being comforable leaving your home is feeling secure in it.",
    ),
  ];
}

class QuestionsModel {
  final int? id;
  final String? questions;
  final String? reason;
  QuestionsModel({this.id, this.questions, this.reason});
}
