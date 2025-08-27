
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxList itemList = [
    // {
    //   'title': AppString.kHome,
    //   'icn': DefaultImages.homeIcn,
    //   'screen': HomeScreen()
    // },
    // {'title': AppString.kRanking, 'icn': DefaultImages.rankingIcn, 'screen': LeaderboardScreen()},
    // {'title': AppString.kFriends, 'icn': DefaultImages.friendsIcn, 'screen': FriendsScreen()},
    // {'title': AppString.kProfile, 'icn': DefaultImages.userIcn, 'screen': ProfileScreen()},
  ].obs;
}
