import 'package:brain_bucks/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  RxInt currentIndex = 0.obs;
  RxList onboardingData = [
    {"image": DefaultImages.playLikeMillionaireImage},
    {"image": DefaultImages.playLikeGeniusImage},
    {"image": DefaultImages.dominateDuelImage},
  ].obs;
}
