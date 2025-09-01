import 'dart:ui';

import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/auth/login.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showShinglePlayerDialog(BuildContext context) {
  showMessage("🔆❔Single Player Dialog");
  showDialog(
    context: context,
    // barrierColor: AppColors.kOpacityBackGround,
    barrierDismissible: false,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.all(AppDimen.padding),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimen.radius)),
          content: SinglePlayerDialog(),
        ),
      );
    },
  );
}

class SinglePlayerDialog extends StatelessWidget {
  const SinglePlayerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.kBackGround,
        borderRadius: BorderRadius.circular(AppDimen.smallRadius),
        image: DecorationImage(image: AssetImage(DefaultImages.dialogBgImage), fit: BoxFit.fill),
      ),
      padding: EdgeInsets.all(AppDimen.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          authTitleRow(AppString.kSinglePlayerGame.tr),
          verticalSpace(16),
          sessionWidget(title: AppString.kSoloStreakSession.tr, image: DefaultImages.soloStreakImage, bg: DefaultImages.soloSessionBgImage, onPressed: () {}),
          verticalSpace(16),
          sessionWidget(title: AppString.kTopicMasterySession.tr, image: DefaultImages.topicMasteryImage, bg: DefaultImages.topicMasterySessionBgImage, onPressed: () {}),
          verticalSpace(16),
          sessionWidget(title: AppString.kTimeBlitzSession.tr, image: DefaultImages.timeBlitzImage, bg: DefaultImages.timeBlitzSessionBgImage, onPressed: () {}),
          verticalSpace(16),
        ],
      ),
    );
  }

  Widget sessionWidget({required String title, required String image, required String bg, required Function()? onPressed}) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.fromLTRB(30, 13, 34, 13),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bg), fit: BoxFit.fill),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          assetImage(image, h: 76),
          // horizontalSpace(24),
          Expanded(
            child: Column(
              children: [
                FittedBox(child: Text(title, style: pNunitoExtraBold10.copyWith(fontSize: 18))),
                verticalSpace(8),
                CommonThemeButton(title: AppString.kPlayGame.tr, icon: DefaultImages.playIcon, onPressed: onPressed, fontSize: 13, height: 36, width: Get.width * 0.4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
