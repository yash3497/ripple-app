import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/register/views/successfully_act_created.dart';
import 'package:ripple_healthcare/app/modules/register/views/training_experiance_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/log_in/bindings/log_in_binding.dart';
import '../modules/log_in/views/log_in_view.dart';
import '../modules/log_in/views/otp_verify_view.dart';
import '../modules/log_in/views/splash_screen.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCRCEEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCRCEEN,
      page: () => const SplashScreen(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN,
      page: () => const LogInView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFY,
      page: () => const OtpVerifyView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.TRAINING_EXP,
      page: () => const TrainingExperianceView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS_VIEW,
      page: () => const SuccessFullAccountCreated(),
      binding: RegisterBinding(),
    ),
  ];
}
