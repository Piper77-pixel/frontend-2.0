import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/view/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxList itemList = [
    {'title': AppString.kHome, 'icn': DefaultImages.tabHomeIcon, 'screen': HomeScreen()},
    {'title': AppString.kExplore, 'icn': DefaultImages.tabExploreIcon, 'screen': HomeScreen()},
    {'title': AppString.kChallenges, 'icn': DefaultImages.tabChallengesIcon, 'screen': HomeScreen()},
    {'title': AppString.kProfile, 'icn': DefaultImages.tabProfileIcon, 'screen': HomeScreen()},
  ].obs;
}
