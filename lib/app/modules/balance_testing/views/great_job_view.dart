import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/app_button.dart';
import 'package:ripple_healthcare/app/widget/app_text_widget.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class GreatJobView extends StatelessWidget {
//   const GreatJobView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           Expanded(
//               child: PageView(
//             children: [

//             ],
//           ))
//         ],
//       )),
//     );
//   }
// }

class GreatJobView extends StatefulWidget {
  @override
  _GreatJobViewState createState() => _GreatJobViewState();
}

class _GreatJobViewState extends State<GreatJobView> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handlePageChange);
    _controller.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      _currentPage = _controller.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.7,
            child: PageView(
              controller: _controller,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextWidget(
                        text: "Great Job!",
                        textColor: AppColor.steadyButtonColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      addVerticalSpace(8),
                      AppTextWidget(
                        text:
                            "Don’t worry if you got some questions wrong, what matters is that you’re focusing on the game.",
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textGrayColor,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextWidget(
                        text:
                            "Make sure to do the body exercise and the brain game at the same time.",
                        textColor: AppColor.steadyButtonColor,
                        textAlign: TextAlign.center,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      addVerticalSpace(8),
                      AppTextWidget(
                        text:
                            "You’ll be learning to balance while distracted. That’s the key to your training.",
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textGrayColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller, // PageController
                  count: 2, // Number of pages
                  effect: const WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      dotColor: Color(0xFFE1E1E1),
                      activeDotColor: AppColor.steadyButtonColor),
                ),
                addVerticalSpace(20),
                AppButton(
                  onPressed: () {
                    if (_currentPage < 1) {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else if (_currentPage == 1) {
                      Get.until((route) =>
                          route.settings.name == Routes.STEADY_STEPS_DASHBOARD);
                    }
                  },
                  buttonText: _currentPage < 1 ? "Next" : "Ok",
                  bgColor: AppColor.steadyButtonColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
