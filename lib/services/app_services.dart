import 'dart:math';

class AppServices {
  static String formatSecondsToTimeString(int seconds) {
    int minutes = (seconds ~/ 60);
    int remainingSeconds = seconds % 60;

    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr =
        (remainingSeconds < 10) ? '0$remainingSeconds' : '$remainingSeconds';

    return '$minutesStr:$secondsStr';
  }

  int getRandomIndex(int listLength) {
    Random random = Random();
    return random.nextInt(listLength);
  }
}
