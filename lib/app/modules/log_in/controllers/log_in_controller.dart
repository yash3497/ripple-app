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
}
