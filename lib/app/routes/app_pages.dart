import 'package:get/get.dart';
import 'package:ripple_healthcare/app/modules/steady_step_balance_test/views/steady_step_stage_view.dart';

import '../modules/balance_testing/bindings/balance_testing_binding.dart';
import '../modules/balance_testing/views/balance_testing_view.dart';
import '../modules/balance_testing/views/mcq_test_view.dart';
import '../modules/balance_testing/views/well_done_screen.dart';
import '../modules/controll/bindings/controll_binding.dart';
import '../modules/controll/views/controll_view.dart';
import '../modules/daily_challenges/bindings/daily_challenges_binding.dart';
import '../modules/daily_challenges/views/challenges_test_view.dart';
import '../modules/daily_challenges/views/daily_challenges_view.dart';
import '../modules/daily_challenges/views/mcq_questions_view.dart';
import '../modules/dashboard_view/bindings/dashboard_view_binding.dart';
import '../modules/dashboard_view/views/dashboard_view_view.dart';
import '../modules/hip_pro_bluetooth_flow/bindings/hip_pro_bluetooth_flow_binding.dart';
import '../modules/hip_pro_bluetooth_flow/views/bluetooth_connect_proccess.dart';
import '../modules/hip_pro_bluetooth_flow/views/hip_pro_bluetooth_flow_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/bottom_navigation_bar.dart';
import '../modules/home/views/home_view.dart';
import '../modules/log_in/bindings/log_in_binding.dart';
import '../modules/log_in/views/hello_screen.dart';
import '../modules/log_in/views/log_in_view.dart';
import '../modules/log_in/views/onboard_screen.dart';
import '../modules/log_in/views/otp_verify_view.dart';
import '../modules/log_in/views/questions_screen.dart';
import '../modules/log_in/views/splash_screen.dart';
import '../modules/log_in/views/successfully_login.dart';
import '../modules/medication/bindings/medication_binding.dart';
import '../modules/medication/views/medication_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register/views/successfully_act_created.dart';
import '../modules/register/views/training_experiance_view.dart';
import '../modules/reward/bindings/reward_binding.dart';
import '../modules/reward/views/reward_view.dart';
import '../modules/steady_step_balance_test/bindings/steady_step_balance_test_binding.dart';
import '../modules/steady_step_balance_test/views/steady_step_balance_test_view.dart';
import '../modules/steady_step_progress/bindings/steady_step_progress_binding.dart';
import '../modules/steady_step_progress/views/steady_step_progress_view.dart';
import '../modules/steady_steps_dashboard/bindings/steady_steps_dashboard_binding.dart';
import '../modules/steady_steps_dashboard/views/steady_steps_dashboard_view.dart';
import '../modules/steady_steps_onboarding/bindings/steady_steps_onboarding_binding.dart';
import '../modules/steady_steps_onboarding/views/steady_steps_onboard_flow.dart';
import '../modules/steady_steps_onboarding/views/steady_steps_onboarding_view.dart';
import '../modules/test_stage_wise/bindings/test_stage_wise_binding.dart';
import '../modules/test_stage_wise/views/stage_view.dart';
import '../modules/test_stage_wise/views/test_done_view.dart';
import '../modules/test_stage_wise/views/test_stage_wise_view.dart';
import '../modules/walking_steps_chart/bindings/walking_steps_chart_binding.dart';
import '../modules/walking_steps_chart/views/walking_steps_chart_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCRCEEN,
      page: () => const SplashScreen(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => const OnBoardScreen(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESSLOGIN,
      page: () => const SuccessFullyLoginScreen(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.HELLO_SCREEN,
      page: () => const HelloScreen(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.QUE_SCREEN,
      page: () => const QuestionsScreen(),
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
    GetPage(
      name: _Paths.DASHBOARD_VIEW,
      page: () => const DashboardViewView(),
      binding: DashboardViewBinding(),
    ),
    GetPage(
      name: _Paths.HIP_PRO_BLUETOOTH_FLOW,
      page: () => const HipProBluetoothFlowView(),
      binding: HipProBluetoothFlowBinding(),
    ),
    GetPage(
      name: _Paths.BLUETOOTH_CONNECT_PROCESS,
      page: () => const BluetoothConnectProccessView(),
      binding: HipProBluetoothFlowBinding(),
    ),
    GetPage(
      name: _Paths.TEST_STAGE_WISE,
      page: () => const TestStageWiseView(),
      binding: TestStageWiseBinding(),
    ),
    GetPage(
      name: _Paths.STAGE_VIEW,
      page: () => const StageView(),
      binding: TestStageWiseBinding(),
    ),
    GetPage(
      name: _Paths.TEST_DONE,
      page: () => const TestDoneView(),
      binding: TestStageWiseBinding(),
    ),
    GetPage(
      name: _Paths.CONTROLL,
      page: () => const ControllView(),
      binding: ControllBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => BottomNavigationBarView(),
      // binding: ControllBinding(),
    ),
    GetPage(
      name: _Paths.MEDICATION,
      page: () => const MedicationView(),
      binding: MedicationBinding(),
    ),
    GetPage(
      name: _Paths.WALKING_STEPS_CHART,
      page: () => const WalkingStepsChartView(),
      binding: WalkingStepsChartBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.STEADY_STEPS_ONBOARDING,
      page: () => const SteadyStepsOnboardingView(),
      binding: SteadyStepsOnboardingBinding(),
    ),
    GetPage(
      name: _Paths.STEADY_STEPS_PAGEVIEW,
      page: () => const SteadyStepsPageView(),
      binding: SteadyStepsOnboardingBinding(),
    ),
    GetPage(
      name: _Paths.STEADY_STEPS_DASHBOARD,
      page: () => const SteadyStepsDashboardView(),
      binding: SteadyStepsDashboardBinding(),
    ),
    GetPage(
      name: _Paths.BALANCE_TESTING,
      page: () => const BalanceTestingView(),
      binding: BalanceTestingBinding(),
    ),
    GetPage(
      name: _Paths.MCQ_TEST_VIEW,
      page: () => const MCQTestView(),
      binding: BalanceTestingBinding(),
    ),
    GetPage(
      name: _Paths.WELL_DONE_SCREEN,
      page: () => const WellDoneScreen(),
      binding: BalanceTestingBinding(),
    ),
    GetPage(
      name: _Paths.STEADY_STEP_PROGRESS,
      page: () => const SteadyStepProgressView(),
      binding: SteadyStepProgressBinding(),
    ),
    GetPage(
      name: _Paths.REWARD,
      page: () => const RewardView(),
      binding: RewardBinding(),
    ),
    GetPage(
      name: _Paths.DAILY_CHALLENGES,
      page: () => const DailyChallengesView(),
      binding: DailyChallengesBinding(),
    ),
    GetPage(
      name: _Paths.DAILY_CHALLENGES_TEST_VIEW,
      page: () => const DailyChallengesTestView(),
      binding: DailyChallengesBinding(),
    ),
    GetPage(
      name: _Paths.DAILY_CHALLENGES_MCQ_VIEW,
      page: () => const DailyChallengMcqQuestionsView(),
      binding: DailyChallengesBinding(),
    ),
    GetPage(
      name: _Paths.STEADY_STEP_BALANCE_TEST,
      page: () => const SteadyStepBalanceTestView(),
      binding: SteadyStepBalanceTestBinding(),
    ),
    GetPage(
      name: _Paths.STEADY_STEP_STAGE_VIEW,
      page: () => const SteadyStepStageView(),
      binding: SteadyStepBalanceTestBinding(),
    ),
  ];
}
