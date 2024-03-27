import 'dart:convert';

import 'package:get/get.dart';
import 'package:ripple_healthcare/model/users.dart';
import 'package:ripple_healthcare/services/http_services.dart';
import 'package:ripple_healthcare/services/storage_service.dart';
import 'package:ripple_healthcare/utils/api_constants.dart';
import 'package:ripple_healthcare/utils/db_keys.dart';

class SteadyStepsDashboardController extends GetxController {
  //TODO: Implement SteadyStepsDashboardController
  Users users =
      Users(phoneNo: 0, name: "", gender: "", age: 0, questions: [], pain: []);

  List SteadyStepCat = [
    {
      "title": "Balance Training",
      "subTitle":
          "Empower elders with personalized balance training on our app.",
      "img": "balanceTraining.png"
    },
    // {
    //   "title": "Progress",
    //   "subTitle":
    //       "Track your journey and witness progress seamlessly on our app..",
    //   "img": "progress.png"
    // },
    // {
    //   "title": "Daily challenges",
    //   "subTitle":
    //       "Conquer daily challenges, win rewards, transform your wellness.",
    //   "img": "dailyChallenge.png"
    // },
    {
      "title": "Take Balance Test",
      "subTitle": "Promoting confidence and preventing falls.",
      "img": "takeBalanceTest.png"
    },
    // {
    //   "title": "Win Rewards",
    //   "subTitle": "Unlock exciting rewards with every interaction on our app",
    //   "img": "reward.png"
    // },
  ];

  fetchUserData() async {
    try {
      Map<String, dynamic> body = {
        "phoneNo": int.parse(await StorageService().read(DbKeys.phoneNo)),
      };
      var response =
          await HttpServices.post(ApiConstants.user, jsonEncode(body));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        users = Users.fromJson(data['user']);

        update();
      } else {
        print("Fetch Users Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Fetch Users Error: $e");
    }
  }
}
