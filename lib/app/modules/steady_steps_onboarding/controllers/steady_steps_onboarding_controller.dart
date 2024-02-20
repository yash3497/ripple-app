import 'package:get/get.dart';

class SteadyStepsOnboardingController extends GetxController {
  int indicator = 0;

  List<PageViewModel> onboardList = [
    PageViewModel(
        id: 1,
        title: "Balance",
        subTitle: "Practice",
        img: "assets/images/ssOnboard1.png",
        desc:
            "Better stability, fewer slips, and a whole lot more confidence in your daily groove. Our balance exercises are like your secret weapon for a healthier, more active lifestyle, and we can't wait for you to dive in!"),
    PageViewModel(
        id: 2,
        title: "Daily Challenges",
        subTitle: "Take up",
        img: "assets/images/ssOnboard2.png",
        desc:
            "Uncover a fresh challenge daily, where each day brings a new opportunity for excitement. From gentle stretches to targeted movements designed to enhance your well-being,"),
    PageViewModel(
        id: 3,
        title: "Progress",
        subTitle: "TRACK YOUR",
        img: "assets/images/ssOnboard3.png",
        desc:
            "Your fitness journey is more than just daily exercises; it's a continuous progression. Monitor your achievements, from completing challenges to improving your overall strength and flexibility."),
    PageViewModel(
        id: 4,
        title: "Balance",
        subTitle: "ASSESS YOUR",
        img: "assets/images/ssOnboard4.png",
        desc:
            "Your safety is our priority, and with our balance check, you can stride confidently towards a more stable future. "),
  ];
}

class PageViewModel {
  final int? id;
  final String? desc;
  final String? subTitle;
  final String? title;
  final String? img;

  PageViewModel({this.id, this.desc, this.subTitle, this.title, this.img});
}
