import 'dart:ui';

import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/core/controller/friends_list_controller.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/screen/friends_screen/friends_profile_screen.dart';
import 'package:brain_bucks/view/screen/friends_screen/friends_screen_widget.dart';

class FriendRequestView extends StatefulWidget {
  const FriendRequestView({super.key});

  @override
  State<FriendRequestView> createState() => _FriendRequestViewState();
}

class _FriendRequestViewState extends State<FriendRequestView> {
  FriendsListController friendsListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            CommonSearchTextField(
              hintText: AppString.kSearch.tr,
              controller: friendsListController.requestController,
              onChanged: (value) {},
              onTap: () {
                friendsListController.isSearch.value = true;
              },
            ),
            verticalSpace(16),

            // Results with blur background
            Expanded(
              child: Stack(
                children: [
                  // Background (content behind)
                  ImageFiltered(
                    imageFilter: !friendsListController.isSearch.value ? ImageFilter.blur(sigmaY: 0, sigmaX: 0) : ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: ListView.builder(
                      itemCount: friendsListController.friendRequestsList.length,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      // physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var dict = friendsListController.friendRequestsList[index];
                        return friendRequestsWidget(
                          profile: dict['profile'],
                          title: dict['title'],
                          mutualFri: dict['mutualFri'],
                          time: dict['time'],
                          friendList: dict['friendList'],
                          actionProfile: () {
                            Get.to(() => FriendsProfileScreen());
                          },
                          actionAccept: () {},
                          actionDecline: () {},
                        );
                      },
                    ),
                  ),
                  // Blurred container (only this part is blurred)
                  friendsListController.isSearch.value
                      ? Container(
                          decoration: boxDecoration(color: AppColors.kBackGround, radius: 16),
                          padding: const EdgeInsets.all(8),
                          child: friendsListController.filteredUsers.isEmpty
                              ? SizedBox()
                              : ListView.builder(
                                  itemCount: friendsListController.filteredUsers.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    var dict = friendsListController.filteredUsers[index];
                                    return userWidget(profile: dict['image'], name: dict['name'], bgColor: index == 0 ? AppColors.kWhite.withOpacity(0.12) : AppColors.kBackGround);
                                  },
                                ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget userWidget({String? profile, String? name, Color? bgColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 11),
        decoration: boxDecoration(color: bgColor, radius: AppDimen.buttonRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: boxShapeDecoration(
                    color: AppColors.kBlack,
                    shape: BoxShape.circle,
                    border: GradientBoxBorder(gradient: LinearGradient(colors: [AppColors.kHex60148C, AppColors.kHexC674F7] /*begin: Alignment.topRight, end: Alignment.bottomCenter*/), width: 1.36),
                  ),
                  child: Center(
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(profile!), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(8),
                Text(name!, style: pNunitoBold10.copyWith(fontSize: 14)),
              ],
            ),
            CommonButton(title: AppString.kREQUEST.tr, height: 24, width: 99, style: pNunitoBold10),
          ],
        ),
      ),
    );
  }
}
