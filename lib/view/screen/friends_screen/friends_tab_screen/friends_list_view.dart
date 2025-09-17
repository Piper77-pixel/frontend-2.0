import 'package:brain_bucks/view/screen/friends_screen/friends_profile_screen.dart';
import 'package:brain_bucks/view/screen/friends_screen/friends_screen_widget.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/core/controller/friends_list_controller.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FriendsListView extends StatelessWidget {
  FriendsListView({super.key});

  FriendsListController friendsListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
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

          ListView.builder(
            itemCount: friendsListController.friendsList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              var dict = friendsListController.friendsList[index];
              return friendRequestsWidget(
                profile: dict['profile'],
                title: dict['title'],
                mutualFri: dict['mutualFri'],
                time: dict['time'],
                friendList: dict['friendList'],
                actionProfile: () {
                  Get.to(() => FriendsProfileScreen());
                },
                isShowButton: false,
                profileSize: 44,
              );
            },
          ),
        ],
      );
    });
  }
}
