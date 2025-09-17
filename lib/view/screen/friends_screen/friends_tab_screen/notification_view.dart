import 'package:brain_bucks/core/controller/friends_list_controller.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});

  FriendsListController friendsListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: friendsListController.notificationsList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        var dict = friendsListController.notificationsList[index];
        return notificationDataWidget(image: dict['image'], title: dict['title'], description: dict['description']);
      },
    );
  }

  Widget notificationDataWidget({String? image, title, description}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(color: AppColors.kBlack, borderRadius: BorderRadius.circular(AppDimen.buttonRadius)),
        padding: EdgeInsets.all(AppDimen.padding),
        child: Row(
          children: [
            assetImage(image!, h: 48, w: 48),
            horizontalSpace(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title!, style: pRobotoSemiBold10.copyWith(fontSize: 14)),
                  Text(description!, style: pRobotoRegular10.copyWith(fontSize: 10), maxLines: 3, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
