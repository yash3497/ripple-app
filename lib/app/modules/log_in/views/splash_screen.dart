import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_healthcare/app/routes/app_pages.dart';
import 'package:ripple_healthcare/services/storage_service.dart';
import 'package:ripple_healthcare/utils/db_keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () async {
      if (await StorageService().read(DbKeys.token) != null) {
        Get.offAndToNamed(Routes.STEADY_STEPS_DASHBOARD);
      } else {
        Get.offAndToNamed(Routes.ONBOARD);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Image.asset("assets/images/logogif.gif"),
        ),
      ),
    );
  }
}
