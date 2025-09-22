import 'dart:ffi';

import 'package:brain_bucks/utils/images.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final List<Map<String, dynamic>> achievementsList = [
    {
      "title": "History",
      "icon": DefaultImages.topicHistoryImage, // your image asset
      'is_play': false,
      "levels": [
        {
          "name": "Beginner",
          "status": "In Progress",
          "progress": "33 Hug x 10 Hug",
          "color": "red", // or hex like "#FF4500"
          "completed": true,
        },
        {"name": "Pro", "status": "Completed!", "progress": "", "color": "cyan", "completed": true},
        {"name": "Master", "status": "Completed!", "progress": "", "color": "purple", "completed": true},
      ],
    },
    {
      "title": "Literature",
      "icon": DefaultImages.topicLiteratureImage, // your image asset,
      'is_play': true,
      "levels": [
        {"name": "Beginner", "status": "Completed!", "progress": "", "color": "red", "completed": true},
        {"name": "Pro", "status": "Locked", "progress": "", "color": "grey", "completed": false},
        {"name": "Master", "status": "Locked", "progress": "", "color": "grey", "completed": false},
      ],
    },
  ];
  final RxList challengesList = [
    {"image": DefaultImages.smallSummerChallengeImage, "title": "Summer challenge is Done!", 'is_play': false},
    {"image": DefaultImages.masterScienceImage, "title": "Master Science challenge is ready!", 'is_play': true},
    {"image": DefaultImages.weekendWarriorImage, "title": "weekend warrior challenge is ready!", 'is_play': true},
  ].obs;
  final RxList gameplayList = [
    {"image": DefaultImages.flashPurpleIcon, "title": "Highest score", 'count': '2,500'},
    {"image": DefaultImages.icGreenFlagIcon, "title": "Number of won", 'count': '20'},
    {"image": DefaultImages.icRedFlagIcon, "title": "Number of lose", 'count': '12'},
    {"image": DefaultImages.icDuelIcon, "title": "Number of duel game", 'count': '12'},
    {"image": DefaultImages.icQuestionIcon, "title": "Number of single gamee", 'count': '12'},
  ].obs;
}
