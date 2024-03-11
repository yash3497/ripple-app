class ApiConstants {
  static String baseUrl = 'http://backend.app.ripplehealthcare.in/api';
  static String twoFactorUrl =
      'https://2factor.in/API/V1/6f1874d0-aa08-11ee-8cbb-0200cd936042/SMS';
  static String login = '$baseUrl/auth/login';
  static String register = '$baseUrl/auth/register';
  static String verifyOtp = '$twoFactorUrl/VERIFY';
  static String user = '$baseUrl/user';
  static String balanceTest = '$baseUrl/balanceTests';
}
