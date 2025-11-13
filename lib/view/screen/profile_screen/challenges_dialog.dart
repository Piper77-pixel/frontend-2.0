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
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/gradient_borders.dart';

class ChallengesDialog extends StatelessWidget {
  ChallengesDialog({super.key});

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
          padding: EdgeInsets.all(AppDimen.padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              authTitleRow(AppString.kChallenges.tr),
              verticalSpace(Get.height * 0.018), //16
              ListView.builder(
                shrinkWrap: true,
                itemCount: profileController.challengesList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  var dict = profileController.challengesList[index];
                  return challengesWidget(isPlay: dict['is_play'], image: dict['image'], title: dict['title'], actionPlayNow: () {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget challengesWidget({bool isPlay = false, required String image, required String title, Function()? actionPlayNow}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        height: 70,
        decoration: boxDecoration(
          color: AppColors.kBlack,
          radius:8,
          border: GradientBoxBorder(
            gradient: SweepGradient(
              colors: isPlay == true
                  ? [AppColors.kBackGround, AppColors.kHexB25BE6, AppColors.kBackGround, AppColors.kHexB25BE6]
                  : [AppColors.kBackGround, AppColors.kHex5BE6A1, AppColors.kBackGround, AppColors.kHex5BE6A1],
              stops: [0.0, 0.5, 0.0, 0.9],
            ),
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: AppDimen.paddingSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(8), child: assetImage(image, h: 53)),
                  horizontalSpace(16),
                  Expanded(child: Text(title, style: pRobotoSemiBold10.copyWith(fontSize: 16), maxLines: 2)),
                ],
              ),
            ),

            isPlay == true ? CommonThemeButton(title: AppString.kPlayNow.tr, height: 25, width: 75, onPressed: actionPlayNow, fontSize: 10) : assetImage(DefaultImages.doneIcon, h: 40),
          ],
        ),
      ),
    );
  }
}
