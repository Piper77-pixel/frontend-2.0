import 'package:brain_bucks/utils/images.dart';
import 'package:get/get.dart';

class ChallengesController extends GetxController {
  final List<Challenge> challenges = [
    Challenge(
      title: "Summer Challenge",
      background: DefaultImages.summerChallengeImage,
      days: 360,
      hours: 24,
      minutes: 60,
      seconds: 60,
      coins: 1138,
      energy: 2128,
    ),
    Challenge(
      title: "Spring Challenge",
      background: DefaultImages.springChallengeImage,
      days: 360,
      hours: 24,
      minutes: 60,
      seconds: 60,
      coins: 1138,
      energy: 2128,
    ),
  ];


}
class Challenge {
  final String title;
  final String background;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final int coins;
  final int energy;
  final String buttonText;

  Challenge({
    required this.title,
    required this.background,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.coins,
    required this.energy,
    this.buttonText = "Enrol now",
  });
}
