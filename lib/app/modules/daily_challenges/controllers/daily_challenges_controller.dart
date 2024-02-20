import 'dart:async';

import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/daily_challenges/views/mcq_questions_view.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';

class DailyChallengesController extends GetxController {
  String selectedWeek = "This Week";

  int? selectedMcqAnswer;
  // Remaining time to start test(before test start it will be running )
  int testStartTimer = 5;
  // Remaining time of test(current test remaining time )
  int testPlayTimer = 10;

  late Timer timer;
  late Timer timer2;

  void startTimer() {
    // this boolean show remaining time to start test
    // isTimerStart = true;
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      if (testStartTimer == 0) {
        timer.cancel();
        // after stage first is start it will be false
        // isTimerStart = false;
        // start the test here (stage 1)
        // testIsStart = true;
        // [testStartTimer] again set to 5 sec for stage (temprory)
        // testStartTimer = 5;
        Get.toNamed(Routes.DAILY_CHALLENGES_MCQ_VIEW);

        // This Periodic Timer For Test Play (For 10 Second)
        Timer.periodic(Duration(seconds: 1), (timer2) {
          if (testPlayTimer == 0) {
            timer2.cancel();
            // it set false here bcz when its false [Start Stage button ] will be display
            // testIsStart = false;
            // for  statically display  stage 2 view so i can update StageCounter to 2
            // stageCounter = 2;
            // again set it to 10 for next stage
            testPlayTimer = 10;
            testStartTimer = 5;
            Get.to(() => GreateJobView());

            // testEnd bool is true then Well done screen is visible
            // (for testing i will be true this boolean after stageCounter==2 it hit when stage2 button pressed )
            // if (testEnd) Get.toNamed(Routes.TEST_DONE);

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

  List<String> weekDropDownList = ["This Week", "Last 6 Week"];

  List mcqList = ["Ramayana", "Bhagwat Gita", "Bible", "Shiv Puran"];
}
