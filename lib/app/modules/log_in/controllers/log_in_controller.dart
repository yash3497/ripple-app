import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/model/users.dart';
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

  Users users =
      Users(phoneNo: 0, name: "", gender: "", age: 0, questions: [], pain: []);

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

  sendOtp(bool register) async {
    try {
      if (phoneNumberController.text != "1234567890") {
        Map<String, dynamic> body = {
          "Param1": "1107171041172782755",
          "Param2": "91${phoneNumberController.text}",
          "Param3": "417789AaETJKNT65f439dbP1"
        };
        var response = await HttpServices.post(
            "${ApiConstants.otpUrl}?template_id=65f438cbd6fc056f6a2b8dc2&mobile=91${phoneNumberController.text}&authkey=417789AaETJKNT65f439dbP1",
            jsonEncode(body));
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['type'] == 'success') {
            Fluttertoast.showToast(msg: "OTP Sent Successfully");
            Get.toNamed(Routes.OTP_VERIFY, arguments: {'register': register});
          } else {
            Fluttertoast.showToast(msg: "Something Went Wrong!");
          }
        } else {
          print('Failed to generate OTP');
          Fluttertoast.showToast(msg: 'Network Error');
        }
        Get.toNamed(Routes.OTP_VERIFY, arguments: {'register': register});
      } else {
        Get.toNamed(Routes.OTP_VERIFY, arguments: {'register': register});
      }
    } catch (e) {
      print("Error in sending OTP $e");
    }
  }

  verifyOtp(bool register) async {
    try {
      if (otpController.text != "3042") {
        var response = await HttpServices.getWithHeader(
            '${ApiConstants.verifyOtp}?otp=${otpController.text}&mobile=91${phoneNumberController.text}',
            {
              'authkey': '417789AaETJKNT65f439dbP1',
            });
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['type'] == 'success') {
            if (register) {
              users.phoneNo = int.parse(phoneNumberController.text);
              Get.toNamed(Routes.SUCCESSLOGIN, arguments: {'register': true});
            } else {
              login();
            }
          } else {
            Fluttertoast.showToast(msg: 'Wrong Otp!');
          }
        }
      } else {
        if (register) {
          users.phoneNo = int.parse(phoneNumberController.text);
          Get.toNamed(Routes.SUCCESSLOGIN, arguments: {'register': true});
        } else {
          login();
        }
      }
    } catch (e) {
      print("Error in verifying OTP $e");
    }
  }

  resendOtp(bool register) async {
    seconds = 30;
    updateTimer();
    sendOtp(register);
  }

  login() async {
    try {
      loginApiCall(false);
    } catch (e) {
      print("Login error : $e");
    }
  }

  loginApiCall(bool register) async {
    Map body = {
      'phoneNo': int.parse(phoneNumberController.text),
    };
    var response =
        await HttpServices.post(ApiConstants.login, jsonEncode(body));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      StorageService().write(DbKeys.token, data['token']);
      StorageService().write(DbKeys.phoneNo, phoneNumberController.text);
      if (register) {
        Get.toNamed(Routes.STEADY_STEPS_ONBOARDING);
      } else {
        Get.toNamed(Routes.SUCCESSLOGIN, arguments: {'register': false});
      }
    } else if (response.statusCode == 404) {
      Fluttertoast.showToast(msg: 'Please create an account.');
      Get.toNamed(Routes.REGISTER);
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong!');
      print('Login Failed ${response.statusCode}');
    }
  }

  register() async {
    try {
      var response = await HttpServices.post(
          ApiConstants.register, jsonEncode(users.toJson()));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        loginApiCall(true);
      } else if (response.statusCode == 404) {
        Fluttertoast.showToast(msg: 'Data not found!');
        Get.toNamed(Routes.REGISTER);
      } else if (response.statusCode == 500) {
        Fluttertoast.showToast(
            msg:
                'Your number is already registered, Please login your account.');
        Get.offAllNamed(Routes.LOG_IN);
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
        questions:
            "I feel some heaviness or weakness in my legs, especially after movement",
        reason:
            "This indicates that your muscles are getting weak, which can increase your risk of having a fall."),
    QuestionsModel(
      id: 2,
      questions: "I need the help of others to stand up from a chair",
      reason:
          "A Person who needs help should start  training while seated to be safe.",
    ),
    QuestionsModel(
      id: 3,
      questions: "I use a walker or cane while walking",
      reason:
          "An older adult using assistive aids shows that they have balance issues.",
    ),
    QuestionsModel(
      id: 4,
      questions: "I have reduced walking or roaming around my house",
      reason: "This shows a clear indicator of decreased mobility.",
    ),
    QuestionsModel(
      id: 5,
      questions:
          "I have noticed some clicking, popping sounds, or pain when I move my legs",
      reason:
          "This indicates that your joints are getting stiffer which may lead to instability while walking.",
    ),
    QuestionsModel(
      id: 6,
      questions: "I have swelling, redness, or warmth around my joints",
      reason: "This shows signs of arthritis which causes reduced mobility.",
    ),
    QuestionsModel(
      id: 7,
      questions:
          "I feel that my muscles are getting stiff, especially in the morning",
      reason:
          "when muscles are stiff, they limit the range of motion in the joints which increases risk of fall.",
    ),
    QuestionsModel(
      id: 8,
      questions: "My muscles feel tight when I move them",
      reason:
          "when muscles are stiff, they restrict motion, thereby decreasing mobility.",
    ),
    QuestionsModel(
      id: 9,
      questions: "I have fallen in the past years",
      reason: "People who have fallen once are likely to fall again.",
    ),
    QuestionsModel(
      id: 10,
      questions: "Sometimes I feel unsteady When I am Walking",
      reason:
          "Unsteadiness or needing support while walking are signs of poor balance.",
    ),
    QuestionsModel(
      id: 11,
      questions:
          "I steady myself by holding onto the furniture when walking at home",
      reason: "This is a sign of poor balance.",
    ),
  ];
}

class QuestionsModel {
  final int? id;
  final String? questions;
  final String? reason;
  QuestionsModel({this.id, this.questions, this.reason});
}
