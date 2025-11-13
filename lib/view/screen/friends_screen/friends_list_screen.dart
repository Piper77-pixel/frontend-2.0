import 'package:brain_bucks/core/controller/friends_list_controller.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/friends_screen/friends_tab_screen/friends_list_view.dart';
import 'package:brain_bucks/view/screen/friends_screen/friends_tab_screen/notification_view.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'custom_tab_bar.dart';
import 'friends_tab_screen/friend_request_view.dart';

class FriendsListScreen extends StatefulWidget {
  final bool isDuel;

  const FriendsListScreen({super.key, this.isDuel = false});

  @override
  State<FriendsListScreen> createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {
  FriendsListController friendsListController = Get.put(FriendsListController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    friendsListController.isSearch.value = false;
    if (widget.isDuel == true) {
      friendsListController.selectedSegment_04.value = 'friend_list';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: buildSystemUiOverlayStyle(),
      child: GestureDetector(
        onTap: () {
          friendsListController.isSearch.value = false;
        },
        child: BgImageWidget(
          bgImage: DefaultImages.gameScreenBgImage,
          child: Obx(() {
            return Column(
              children: [
                backAppBar(buildLabel(friendsListController.selectedSegment_04.value)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 24, 16, 20),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: boxDecoration(
                            color: AppColors.kBlack,
                            radius: AppDimen.radius,
                            border: GradientBoxBorder(
                              gradient: LinearGradient(colors: AppColors.linerSelectedTextFieldBorderColor, begin: Alignment.topCenter, end: Alignment.bottomCenter),
                              width: 1,
                            ),
                          ),
                          child: CustomTabBar(
                            controller: friendsListController.selectedSegment_04,
                            segments: friendsListController.segment.value,
                            backgroundColor: AppColors.kBlack,
                            itemPadding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 24),
                            sliderDecoration: boxDecoration(
                              radius: AppDimen.radius,
                              gradient: LinearGradient(colors: [AppColors.kHex900FE6, AppColors.kHex6E05AB], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                            ),
                            activeStyle: pRobotoMedium10.copyWith(fontSize: 14),
                            inactiveStyle: pRobotoMedium10.copyWith(fontSize: 14),
                          ),
                        ),
                        verticalSpace(16),
                        Expanded(child: buildScreen(friendsListController.selectedSegment_04.value)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  buildScreen(String label) {
    switch (label) {
      case 'request':
        return FriendRequestView();
      case 'friend_list':
        return FriendsListView(isDuel: widget.isDuel);
      case 'notification':
        return NotificationView();
    }
  }

  buildLabel(String label) {
    switch (label) {
      case 'request':
        return AppString.kFriendsRequests.tr;
      case 'friend_list':
        return AppString.kFriendsList.tr;
      case 'notification':
        return AppString.kNotifications.tr;
    }
  }
}

Widget backAppBar(String title) {
  return Container(
    // height: Get.height * 0.155,
    height: SizeConfig.h(126),
    width: SizeConfig.screenWidth,
    decoration: boxDecoration(
      radius: 0,
      decorationImage: DecorationImage(image: AssetImage(DefaultImages.appbarBgImage), fit: BoxFit.fill),
    ),
    padding: EdgeInsets.fromLTRB(16, 0, 30, 0),
    child: SafeArea(
      child: Center(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: assetImage(DefaultImages.backIcon, h: 24, w: 24),
            ),

            Expanded(
              child: Center(child: Text(title, style: pNunitoBold10.copyWith(fontSize: 20))),
            ),
          ],
        ),
      ),

      // child: Center(child: Text(title, style: pNunitoBold10.copyWith(fontSize: 20))),
    ),
  );
}
