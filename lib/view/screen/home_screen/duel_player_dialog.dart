import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/view/screen/auth/login.dart';
import 'package:brain_bucks/view/screen/friends_screen/friends_list_screen.dart';
import 'package:brain_bucks/view/screen/home_screen/single_player_dialog.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuelPlayerDialog extends StatelessWidget {
  const DuelPlayerDialog({super.key});

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
          authTitleRow(AppString.kDuelPlayerGame.tr),
          verticalSpace(16),
          sessionWidget(
            title: AppString.kStandardSession.tr,
            image: DefaultImages.standardSessionImage,
            bg: DefaultImages.soloSessionBgImage,
            onPressed: () {
              Get.back();
              Get.to(() => FriendsListScreen(isDuel: true));
            },
          ),
          verticalSpace(16),
          sessionWidget(title: AppString.kEliminationSession.tr, image: DefaultImages.eliminationSessionImage, bg: DefaultImages.eliminationSessionBgImage, onPressed: () {}),
          verticalSpace(16),
          sessionWidget(title: AppString.kTimeAttackSession.tr, image: DefaultImages.timeAttackSessionImage, bg: DefaultImages.timeBlitzSessionBgImage, onPressed: () {}),
          verticalSpace(16),
          sessionWidget(title: AppString.kTopicChallengeSession.tr, image: DefaultImages.topicChallengeSessionImage, bg: DefaultImages.topicChallengeSessionBgImage, onPressed: () {}),
          verticalSpace(16),
          sessionWidget(title: AppString.kStreakBreakerSession.tr, image: DefaultImages.streakBreakerSessionImage, bg: DefaultImages.streakBreakerSessionBgImage, onPressed: () {}),
        ],
      ),
    );
  }
}
