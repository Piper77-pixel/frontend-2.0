import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/auth/login.dart';
import 'package:brain_bucks/view/screen/games_screen/games_screen.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/icon_image_widget.dart';

class ChooseTopicDialog extends StatelessWidget {
  ChooseTopicDialog({super.key});

  List topicList = [
    {'title': 'History', 'image': DefaultImages.topicHistoryImage},
    {'title': 'Math', 'image': DefaultImages.topicMathImage},
    {'title': 'Literature', 'image': DefaultImages.topicLiteratureImage},
    {'title': 'Science', 'image': DefaultImages.topicScienceImage},
    {'title': 'Geography', 'image': DefaultImages.topicGeographyImage},
    {'title': 'Sports', 'image': DefaultImages.topicSportsImage},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      decoration: boxDecoration(
        color: AppColors.kBackGround,
        radius: AppDimen.smallRadius,
        decorationImage: DecorationImage(image: AssetImage(DefaultImages.dialogBgImage), fit: BoxFit.fill),
      ),
      padding: EdgeInsets.all(AppDimen.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          authTitleRow(AppString.kChooseATopic.tr),
          verticalSpace(24),
          GridView.builder(
            itemCount: topicList.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
            itemBuilder: (context, index) {
              var dict = topicList[index];
              return buildGestureDetector(
                image: dict['image'],
                title: dict['title'],
                onTap: () {
                  Get.back();
                  Get.to(() => GamesScreen(type: AppString.kTopicChallengeSession, image: dict['image'],topic: dict['title'],));
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildGestureDetector({Function()? onTap, String? image, String? title}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: boxDecoration(
          color: AppColors.kBackGround,
         radius: 8,
          border: Border.all(color: AppColors.cBorder),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            assetImage(image!, h: 120, w: 120),
            Text(title!, style: pRobotoRegular10.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
