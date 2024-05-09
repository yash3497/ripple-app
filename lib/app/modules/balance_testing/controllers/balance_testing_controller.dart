import 'dart:async';
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ripple_healthcare/app/modules/log_in/views/questions_screen.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/controllers/steady_step_balance_test_controller.dart';
import 'package:ripple_healthcare/app/modules/steady_steps_dashboard/controllers/steady_steps_dashboard_controller.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/model/balance_training.dart';
import 'package:ripple_healthcare/model/training_questions.dart';
import 'package:ripple_healthcare/services/app_services.dart';
import 'package:ripple_healthcare/services/http_services.dart';
import 'package:ripple_healthcare/services/storage_service.dart';
import 'package:ripple_healthcare/utils/api_constants.dart';
import 'package:ripple_healthcare/utils/db_keys.dart';

class BalanceTestingController extends GetxController {
  //TODO: Implement BalanceTestingController
  bool isInstruction = false;
  int indicator = 0;
  int? selectedMcqAnswer;
  // Remaining time to start test(before test start it will be running )
  int testStartTimer = 4;
  // Remaining time of test(current test remaining time )
  int testPlayTimer = 40;

  late Timer timer;
  late Timer timer2;

  List<BalanceTraining> trainingList = [];
  int exercisePointer = 0;
  List<TrainingQuestions> questions = [];
  List<int> questionPoints = [0, 0, 0, 0, 0];
  int randomIndex = 0;
  bool isStop = false;

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
        Get.toNamed(Routes.MCQ_TEST_VIEW);

        // This Periodic Timer For Test Play (For 10 Second)
        Timer.periodic(Duration(seconds: 1), (timer2) {
          if (testPlayTimer == 0) {
            timer2.cancel();
            // it set false here bcz when its false [Start Stage button ] will be display
            // testIsStart = false;
            // for  statically display  stage 2 view so i can update StageCounter to 2
            // stageCounter = 2;
            // again set it to 10 for next stage
            testPlayTimer = 40;
            testStartTimer = 4;
            Get.toNamed(Routes.WELL_DONE_SCREEN);

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

  List mcqList = ["Ramayana", "Bhagwat Gita", "Bible", "Shiv Puran"];
  List questionList = [
    {
      "question": "How was the difficulty of today’s cognitive exercises?",
      "optionList": ["To Easy", "To Hard", "Just Right"]
    },
    {
      "question": "How was the difficulty of today’s physical exercises?",
      "optionList": ["To Easy", "To Hard", "Just Right"]
    },
    {
      "question":
          "Did you experience any headache or dizziness during today’s session?",
      "optionList": ["Severe", "Moderate", "Mild", "None"]
    },
    {
      "question":
          "How much exertion was required to complete today’s exercises?",
      "optionList": ["Severe", "Moderate", "Mild", "None"]
    },
    {
      "question":
          "Have you fallen since your training day on ${DateFormat('dd/MM/yyyy').format(DateTime.now())}?",
      "optionList": ["Yes", "No"]
    }
  ];

  fetchTraining() async {
    try {
      List question = Get.put(SteadyStepsDashboardController()).users.questions;
      Map<String, dynamic> body = {
        "userAnswers": [
          {
            "questionId": 1,
            "answer": "${question.firstWhere(
              (question) => question.containsKey('q1'),
              orElse: () => false,
            )['q1'] ? "Yes" : "No"}"
          },
          {
            "questionId": 2,
            "answer": "${question.firstWhere(
              (question) => question.containsKey('q2'),
              orElse: () => false,
            )['q2'] ? "Yes" : "No"}"
          },
          {
            "questionId": 3,
            "answer": "${question.firstWhere(
              (question) => question.containsKey('q3'),
              orElse: () => false,
            )['q3'] ? "Yes" : "No"}"
          },
          {
            "questionId": 4,
            "answer": "${question.firstWhere(
              (question) => question.containsKey('q4'),
              orElse: () => false,
            )['q4'] ? "Yes" : "No"}"
          },
          {
            "questionId": 5,
            "answer": "${question.firstWhere(
              (question) => question.containsKey('q5'),
              orElse: () => false,
            )['q5'] ? "Yes" : "No"}"
          },
          {
            "questionId": 6,
            "answer": "${question.firstWhere(
              (question) => question.containsKey('q6'),
              orElse: () => false,
            )['q6'] ? "Yes" : "No"}"
          },
          {
            "questionId": 7,
            "answer": "${question.firstWhere(
              (question) => question.containsKey('q7'),
              orElse: () => false,
            )['q7'] ? "Yes" : "No"}"
          },
          {
            "questionId": 8,
            "answer": "${question.firstWhere(
              (question) => question.containsKey('q8'),
              orElse: () => false,
            )['q8'] ? "Yes" : "No"}"
          },
          {
            "questionId": 9,
            "answer": "${question.firstWhere(
              (question) => question.containsKey('q9'),
              orElse: () => false,
            )['q9'] ? "Yes" : "No"}"
          },
          {
            "questionId": 10,
            "answer": "${question.firstWhere(
              (question) => question.containsKey('q10'),
              orElse: () => false,
            )['q10'] ? "Yes" : "No"}"
          },
        ]
      };

      var response = await HttpServices.postWithToken(ApiConstants.exercises,
          jsonEncode(body), await StorageService().read(DbKeys.token));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        trainingList = List<BalanceTraining>.from(
            data.map((e) => BalanceTraining.fromJson(e)));
        update();
      } else {
        Fluttertoast.showToast(msg: "Exercise not found!");
      }
    } catch (e) {
      print("Balance Training Fetch Error: $e");
    }
  }

  fetchQuestions() async {
    try {
      var response = await HttpServices.getWithToken(
          ApiConstants.questions, await StorageService().read(DbKeys.token));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        questions = List<TrainingQuestions>.from(
            data.map((e) => TrainingQuestions.fromJson(e)));
        randomIndex = AppServices().getRandomIndex(questions.length);
        update();
      } else {
        Fluttertoast.showToast(msg: "Questions not found!");
      }
    } catch (e) {
      print("Training Questions Fetch Error: $e");
    }
  }
}
