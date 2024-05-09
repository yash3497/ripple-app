class ApiConstants {
  static String baseUrl = 'http://backend.app.ripplehealthcare.in/api';
  static String otpUrl = 'https://control.msg91.com/api/v5/otp';
  static String login = '$baseUrl/auth/login';
  static String register = '$baseUrl/auth/register';
  static String verifyOtp = '$otpUrl/verify';
  static String user = '$baseUrl/user';
  static String balanceTest = '$baseUrl/balanceTests';
  static String exercises = '$baseUrl/exercises/based-on-questions';
  static String questions = '$baseUrl/questions';
}
