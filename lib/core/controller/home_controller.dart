import 'package:brain_bucks/utils/images.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final List<MatchCardData> matches = [
    MatchCardData(
      player1: Player(
        name: "You",
        level: 26,
        avatar: DefaultImages.profileImage,
        hasCrown: true,
        results: ["win", "win", "lose","win", "win"],
      ),
      player2: Player(
        name: "ParisOG",
        level: 24,
        avatar: DefaultImages.profile1Image,
        hasCrown: false,
        results: ["win","lose", "win", "win", "lose"],
      ),
      coins: 120,
      isWinner: true,
    ),
    MatchCardData(
      player1: Player(
        name: "You",
        level: 26,
        avatar: DefaultImages.profile1Image,
        hasCrown: false,
        results: ["win","lose", "win", "win", "lose"],
      ),
      player2: Player(
        name: "MRESK",
        level: 24,
        avatar: DefaultImages.profileImage,
        hasCrown: true,
        results: ["win", "win", "lose","lose", "win"],
      ),
      coins: 120,
      isWinner: false,
    ),   MatchCardData(
      player1: Player(
        name: "You",
        level: 26,
        avatar: DefaultImages.profile1Image,
        hasCrown: false,
        results: ["win","lose", "win", "win", "lose"],
      ),
      player2: Player(
        name: "MRESK",
        level: 24,
        avatar: DefaultImages.profileImage,
        hasCrown: true,
        results: ["win", "win", "lose","lose", "win"],
      ),
      coins: 120,
      isWinner: true,
      isAllWinner: true
    ),
  ];

}
class Player {
  final String name;
  final int level;
  final String avatar;
  final bool hasCrown;
  final List<String> results; // ✅ "win", "lose", "draw"

  Player({
    required this.name,
    required this.level,
    required this.avatar,
    this.hasCrown = false,
    required this.results,
  });
}

class MatchCardData {
  final Player player1;
  final Player player2;
  final int coins;
  final bool isWinner; // ✅ true = green border, false = red border
  final bool ?isAllWinner; // ✅ true = green border, false = red border

  MatchCardData({
    required this.player1,
    required this.player2,
    required this.coins,
    required this.isWinner,
    this.isAllWinner=false,
  });
}
