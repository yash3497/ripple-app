import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/views/test_done_and_feedback_screen.dart';
import 'package:ripple_healthcare/model/balance_test.dart';
import 'package:ripple_healthcare/services/http_services.dart';
import 'package:ripple_healthcare/services/storage_service.dart';
import 'package:ripple_healthcare/utils/api_constants.dart';
import 'package:ripple_healthcare/utils/db_keys.dart';

class SteadyStepBalanceTestController extends GetxController {
  // this boolean show instruction text
  bool isInstructionTab = false;
  // this boolean show remaining time to start test
  bool isTimerStart = false;
  // when this boolean is true Test is Playing and remaining counter show Green and red color bellow 5 second
  bool testIsStart = false;
  // Remaining time to start test(before test start it will be running )
  int testStartTimer = 5;
  // Remaining time of test(current test remaining time )
  int testPlayTimer = 10;
  int testPlayTimer2 = 30;
  // Stage will be update after [testStartTimer] is complted and first stage is completed
  // for test its only 2 stage will be show
  int stageCounter = 0;
  // when this boolean true test will be ended and navigat to TestDoneScreen
  bool testEnd = false;

  // Feedback screen boolean
  bool selectStageView = false;

  late Timer timer;
  late Timer timer2;
  late Timer timer3;

  List<BalanceTest> balanceTests = [];
  int test = 0;
  int feedback = 0;

  int fourstages = 8;
  int stand = 0;
  List<int> exerciseTimer = [];

  void startTimer() {
    // this boolean show remaining time to start test
    isTimerStart = true;
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      if (testStartTimer == 0) {
        timer.cancel();
        // after stage first is start it will be false
        isTimerStart = false;
        // start the test here (stage 1)
        testIsStart = true;
        // [testStartTimer] again set to 5 sec for stage (temprory)
        testStartTimer = 5;

        // This Periodic Timer For Test Play (For 10 Second)
        Timer.periodic(Duration(seconds: 1), (timer2) {
          if (testPlayTimer == 0) {
            timer2.cancel();
            // it set false here bcz when its false [Start Stage button ] will be display
            testIsStart = false;
            // for  statically display  stage 2 view so i can update StageCounter to 2
            stageCounter += 1;
            // again set it to 10 for next stage
            testPlayTimer = 10;
            // testEnd bool is true then Well done screen is visible
            // (for testing i will be true this boolean after stageCounter==2 it hit when stage2 button pressed )
            if (testEnd) Get.to(() => SteadyStepTestDoneView());

            update();
          } else {
            // Current stage timer
            testPlayTimer--;

            update();
          }
        });
      } else {
        // before start test remaining time
        testStartTimer--;

        update();
      }
    });
  }

  void startTimer2(int seconds) {
    // this boolean show remaining time to start test
    isTimerStart = true;
    const oneSecond = Duration(seconds: 1);
    testPlayTimer2 = seconds;
    timer = Timer.periodic(oneSecond, (timer) {
      if (testStartTimer == 0) {
        timer.cancel();
        // after stage first is start it will be false
        isTimerStart = false;
        // start the test here (stage 1)
        testIsStart = true;
        // [testStartTimer] again set to 5 sec for stage (temprory)
        testStartTimer = 5;

        // This Periodic Timer For Test Play (For 10 Second)
        Timer.periodic(Duration(seconds: 1), (timer2) {
          if (testPlayTimer2 == 0) {
            timer2.cancel();
            // it set false here bcz when its false [Start Stage button ] will be display
            testIsStart = false;
            // for  statically display  stage 2 view so i can update StageCounter to 2
            // again set it to 10 for next stage
            testPlayTimer2 = 30;
            // testEnd bool is true then Well done screen is visible
            // (for testing i will be true this boolean after stageCounter==2 it hit when stage2 button pressed )
            Get.to(() => SteadyStepTestDoneView());

            update();
          } else {
            // Current stage timer
            testPlayTimer2--;

            update();
          }
        });
      } else {
        // before start test remaining time
        testStartTimer--;

        update();
      }
    });
  }

  void startTimer3(int seconds) {
    // this boolean show remaining time to start test
    isTimerStart = true;
    testPlayTimer2 = seconds;
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      if (testStartTimer == 0) {
        timer.cancel();
        // after stage first is start it will be false
        isTimerStart = false;
        // start the test here (stage 1)
        testIsStart = true;
        // [testStartTimer] again set to 5 sec for stage (temprory)
        testStartTimer = 5;

        // This Periodic Timer For Test Play (For 10 Second)
        timer3 = Timer.periodic(Duration(seconds: 1), (timer2) {
          // for  statically display  stage 2 view so i can update StageCounter to 2
          // again set it to 10 for next stage
          testPlayTimer2++;
          // testEnd bool is true then Well done screen is visible
          // (for testing i will be true this boolean after stageCounter==2 it hit when stage2 button pressed )

          update();
        });
      } else {
        // before start test remaining time
        testStartTimer--;

        update();
      }
    });
  }

  fetchBalanceTest() async {
    try {
      var response = await HttpServices.getWithToken(
          ApiConstants.balanceTest, await StorageService().read(DbKeys.token));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        balanceTests =
            List<BalanceTest>.from(data.map((e) => BalanceTest.fromJson(e)));
        balanceTests.sort((a, b) => a.rank.compareTo(b.rank));
        update();
      } else {
        print("Fetch Balance Api Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Fetch Balance Test Error: $e");
    }
  }
}
