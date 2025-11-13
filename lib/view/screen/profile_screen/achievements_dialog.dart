import 'dart:ui';

import 'package:brain_bucks/core/controller/profile_controller.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/auth/login.dart';
import 'package:brain_bucks/view/screen/games_screen/games_screen.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AchievementsDialog extends StatelessWidget {
  AchievementsDialog({super.key});

  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.all(AppDimen.padding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimen.radius)),
        content: Container(
          width: SizeConfig.screenWidth,
          decoration: boxDecoration(
            color: AppColors.kBackGround,
            radius: AppDimen.smallRadius,
            decorationImage: DecorationImage(image: AssetImage(DefaultImages.dialogBgImage), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.fromLTRB(AppDimen.padding, AppDimen.padding, AppDimen.padding, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              authTitleRow(AppString.kAchievements.tr),
              verticalSpace(SizeConfig.h(16)), //16
              ListView.builder(
                shrinkWrap: true,
                itemCount: profileController.achievementsList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  var dict = profileController.achievementsList[index];
                  return mainBadgesWidget(
                    image: dict['icon'],
                    title: dict['title'],
                    level: dict['levels'],
                    isPlay: dict['is_play'],
                    actionPlay: () {
                      Get.back();
                      Get.to(() => GamesScreen(type: AppString.kTopicChallengeSession, topic: dict['title'], image: dict['icon']));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainBadgesWidget({List? level, String? title, image, bool? isPlay, Function()? actionPlay}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 14, right: 14),
      child: Container(
        decoration: boxDecoration(color: AppColors.kHex161616, radius: 8, bColor: AppColors.kWhite.withOpacity(0.05)),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      assetImage(image!, h: 56),
                      verticalSpace(3),
                      Text(title!, style: pNunitoBold10.copyWith(fontSize: 13), textAlign: TextAlign.center),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      badgesWidget(title: AppString.kBeginner.tr, image: DefaultImages.fireRedIcon, status: level![0]['status'], isCompleted: level![0]['completed']),
                      horizontalSpace(8),
                      badgesWidget(title: AppString.kPro.tr, image: DefaultImages.fireBlueIcon, status: level[1]['status'], isCompleted: level[1]['completed']),
                      horizontalSpace(8),
                      badgesWidget(title: AppString.kMaster.tr, image: DefaultImages.firePurpleIcon, status: level[2]['status'], isCompleted: level[2]['completed']),
                    ],
                  ),
                ),
              ],
            ),
            isPlay == true
                ? Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: CommonThemeButton(title: AppString.kPlayNow.tr, height: 25, width: 214, onPressed: actionPlay, fontSize: 12),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  badgesWidget({bool isCompleted = false, String? title, status, image}) {
    return Expanded(
      child: Container(
        // height: Get.height * 0.11,
        width: SizeConfig.w(54),
        decoration: boxDecoration(
          // color: AppColors.kGreen,
          radius: 11,
          border: GradientBoxBorder(
            gradient: SweepGradient(
              colors: [AppColors.kWhite.withOpacity(0.1), AppColors.kWhite.withOpacity(0.05)],
              stops: [0.5, 0.0],
              // transform: GradientRotation(90)
            ),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: SizeConfig.h(48),
              width: SizeConfig.w(52),
              decoration: boxDecoration(
                // color: AppColors.kGreen,
                radius: 11,
                decorationImage: DecorationImage(image: AssetImage(isCompleted ? DefaultImages.greenBadgesIcon : DefaultImages.greyBadgesIcon)),
              ),
              // padding: EdgeInsets.fromLTRB(17, Get.height * 0.020, 17, 2),
              child: Padding(
                padding: EdgeInsets.only(top: Get.height * 0.0), //8
                child: Image.asset(image, height: 13, color: isCompleted == false ? AppColors.kGreyFont : null),
              ),
            ),
            verticalSpace(3),
            FittedBox(
              child: isCompleted == false
                  ? Text(title!, style: pNunitoExtraBold10.copyWith(fontSize: 8))
                  : GlowText(title!, style: pNunitoExtraBold10.copyWith(fontSize: 8), glowColor: AppColors.kHex7AAC7C),
            ),
            Text(status ?? AppString.kCompleted.tr, style: pNunitoExtraBold10.copyWith(fontSize: 6, color: AppColors.kHex7A7A7A)),
            verticalSpace(3),
          ],
        ),
      ),
    );
  }
}
