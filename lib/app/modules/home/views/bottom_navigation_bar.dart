import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/controll/controllers/controll_controller.dart';
import 'package:ripple_healthcare/app/modules/controll/views/controll_view.dart';
import 'package:ripple_healthcare/app/modules/dashboard_view/views/dashboard_view_view.dart';
import 'package:ripple_healthcare/app/modules/medication/controllers/medication_controller.dart';
import 'package:ripple_healthcare/app/modules/medication/views/medication_view.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/app/widget/log_out_dialog.dart';
import 'package:ripple_healthcare/utils/app_colors.dart';
import 'package:ripple_healthcare/utils/constant_variable.dart';

class BottomNavigationBarView extends StatefulWidget {
  @override
  _BottomNavigationBarViewState createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _currentIndex = 0;

  // Define your pages/screens here
  final List<Widget> _pages = [
    DashboardViewView(),
    ControllView(),
    MedicationView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CommanAppbar(),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColor.greenColor,
          iconSize: 30,
          unselectedItemColor: AppColor.textGrayColor,
          currentIndex: _currentIndex,
          selectedLabelStyle: TextStyle(fontSize: 2),
          unselectedLabelStyle: TextStyle(fontSize: 2),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (index == 1) {
              Get.lazyPut(() => ControllController());
            }
            if (index == 2) {
              Get.lazyPut(() => MedicationController());
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/homeTab.png")),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/controllsTab.png")),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/pillTab.png")),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class CommanAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CommanAppbar(
      {super.key, this.notificationHide = false, this.isSteadyStep = false});
  final bool notificationHide;
  final bool isSteadyStep;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          logoutDialog(context, isSteadyStep ? "Steady Steps" : "Hip Pro+");
        },
        icon: ImageIcon(AssetImage("assets/images/logoutIcon.png")),
      ),
      titleSpacing: 0,
      title: Text(
        isSteadyStep ? "Steady Steps" : 'Hip Pro*',
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        if (!notificationHide)
          InkWell(
            onTap: () {
              Get.toNamed(Routes.NOTIFICATIONS);
            },
            child: Image.asset(
              "assets/images/bell.png",
              height: 30,
            ),
          ),
        addHorizontalySpace(20)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
