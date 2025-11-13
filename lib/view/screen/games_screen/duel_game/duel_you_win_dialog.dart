import 'dart:ui';

import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/games_screen/duel_game/claim_reward_dialog.dart';
import 'package:brain_bucks/view/screen/games_screen/duel_game/duel_time_out_dialog.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuelYouWinDialog extends StatelessWidget {
  const DuelYouWinDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),

      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.all(AppDimen.padding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimen.radius)),
        alignment: Alignment.topCenter,
        content: Stack(
          alignment: Alignment.topRight - Alignment(0.2, .031),
          children: [
            Container(
              width: SizeConfig.screenWidth,
              decoration: boxDecoration(
                color: AppColors.kBackGround,
                radius: AppDimen.smallRadius,
                decorationImage: DecorationImage(image: AssetImage(DefaultImages.duelWinDialogBgImage), fit: BoxFit.fill),
              ),
              padding: EdgeInsets.all(AppDimen.padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.offAll(() => DashboardManager());
                      },
                      child: assetImage(DefaultImages.closeIcon, h: SizeConfig.h(32), w: SizeConfig.w(32)),
                    ),
                  ),
                  Center(child: assetImage(DefaultImages.youWinTxtImage, h: SizeConfig.h(42))), //42
                  verticalSpace(0),
                  Center(child: assetImage(DefaultImages.hardIcon, h: SizeConfig.h(36))), //36
                  verticalSpace(SizeConfig.h(6)),
                  //12
                  profileStreakWidget(
                    profileImage: DefaultImages.profileImage,
                    earned: '1,138',
                    model: '4',
                    streak: '15',
                    accuracy: '80%',
                    isShowIndicator: true,
                    score: '1,500',
                    hScore: '3,500',
                    progressValue: 0.50,
                  ),
                  verticalSpace(SizeConfig.h(12)), //12

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      lifelineWidget(title: AppString.kLifeline.tr, image: DefaultImages.fiftyIcn, total: AppString.k5050.tr),
                      horizontalSpace(12),
                      lifelineWidget(title: AppString.kAnswer.tr, image: DefaultImages.tickCircleIcon, total: '9/10'),
                    ],
                  ),

                  // verticalSpace(Get.height * 0.018), //16
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter - Alignment(0, .35),
                      children: [
                        Container(
                          // color: Colors.blue,
                          child: assetImage(DefaultImages.achievementCircleImage, h: SizeConfig.h(162), fit: BoxFit.fill),
                        ),
                        assetImage(DefaultImages.achievementNameTxtImage, h: 16),
                      ],
                    ),
                  ),

                  // verticalSpace(8),
                  shareOnWidget(actionFacebook: () {}, actionInstagram: () {}, actionTelegram: () {}, actionTwitter: () {}),
                  verticalSpace(SizeConfig.h(12)), //12
                  CommonThemeButton(
                    title: AppString.kCollect.tr,
                    height: SizeConfig.h(51),
                    onPressed: () {
                      Get.back();
                      handleAClaimRewardDialog(context, () {
                        showMessage(AppString.kClaimReward);
                        Get.offAll(() => DashboardManager());
                      });
                    },
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center - Alignment(-.2, 0.1),
              children: [
                assetImage(DefaultImages.sessionCompletedImage, h: SizeConfig.h(83), w: SizeConfig.w(81), fit: BoxFit.fill),
                Text(
                  AppString.kSessionCompleted.tr,
                  style: pNunitoExtraBold10.copyWith(fontSize: SizeConfig.sp(12)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

handleAClaimRewardDialog(BuildContext context, Function() actionClaim) async {
  showMessage("message===> Abandoned Dialog");
  showDialog(
    barrierDismissible: false,
    // barrierColor: AppColors.kOpacityBackGround,
    context: context,
    builder: (context) {
      return ClaimRewardDialog(actionClaim: actionClaim);
    },
  );
}
