import 'dart:async';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/views/steady_step_balance_test_view.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/views/test_done_and_feedback_screen.dart';

import '../../../routes/app_pages.dart';

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
  // Stage will be update after [testStartTimer] is complted and first stage is completed
  // for test its only 2 stage will be show
  int stageCounter = 1;
  // when this boolean true test will be ended and navigat to TestDoneScreen
  bool testEnd = false;

  // Feedback screen boolean
  bool selectStageView = false;

  late Timer timer;
  late Timer timer2;

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
            stageCounter = 2;
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
}
