import 'dart:ui';

import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/auth/login.dart';
import 'package:brain_bucks/view/screen/games_screen/choose_topic_dialog.dart';
import 'package:brain_bucks/view/screen/games_screen/games_screen.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showPlayerDialog(BuildContext context, Widget screen) {
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
          content: screen,
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
      width: SizeConfig.screenWidth,
      decoration: boxDecoration(
        color: AppColors.kBackGround,
        radius: AppDimen.smallRadius,
        decorationImage: DecorationImage(image: AssetImage(DefaultImages.dialogBgImage), fit: BoxFit.fill),
      ),
      padding: EdgeInsets.symmetric(vertical: AppDimen.padding, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          authTitleRow(AppString.kSinglePlayerGame.tr),
          verticalSpace(16),
          sessionWidget(
            title: AppString.kSoloStreakSession.tr,
            image: DefaultImages.soloStreakImage,
            bg: DefaultImages.soloSessionBgImage,
            onPressed: () {
              Get.back();
              Get.to(() => GamesScreen(type: AppString.kSoloStreakSession,image: DefaultImages.soloStreakQuestionImage,));
            },
          ),
          verticalSpace(16),
          sessionWidget(
            title: AppString.kTopicMasterySession.tr,
            image: DefaultImages.topicMasteryImage,
            bg: DefaultImages.topicMasterySessionBgImage,
            onPressed: () {
              Get.back();
              showPlayerDialog(context, ChooseTopicDialog());
            },
          ),
          verticalSpace(16),
          sessionWidget(
            title: AppString.kTimeBlitzSession.tr,
            image: DefaultImages.timeBlitzImage,
            bg: DefaultImages.timeBlitzSessionBgImage,
            onPressed: () {
              Get.back();
              Get.to(() => GamesScreen(type: AppString.kTimeBlitzSession));
            },
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}

Widget sessionWidget({required String title, required String image, required String bg, required Function()? onPressed}) {
  return Container(
    height: SizeConfig.h(89),
    //height: 86,
    width: SizeConfig.screenWidth,
    padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
    decoration: boxDecoration(
      decorationImage: DecorationImage(image: AssetImage(bg), fit: BoxFit.fill),
      radius: 0
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        assetImage(image),
        // horizontalSpace(24),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FittedBox(child: Text(title, style: pNunitoExtraBold10.copyWith(fontSize: 18))),
              CommonThemeButton(title: AppString.kPlayGame.tr, icon: DefaultImages.playIcon, onPressed: onPressed, fontSize: 13, height: 36, width: Get.width * 0.5),
            ],
          ),
        ),
      ],
    ),
  );
}
