import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ripple_healthcare/app/modules/log_in/bindings/log_in_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "STEADY STEPS",
      initialBinding: LogInBinding(),
      initialRoute: AppPages.INITIAL,
      // initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
