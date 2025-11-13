import 'dart:ui';

import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/screen/games_screen/duel_game/duel_time_out_dialog.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbandonedDialog extends StatelessWidget {
  const AbandonedDialog({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.offAll(() => DashboardManager());
                  },
                  child: assetImage(DefaultImages.closeIcon, h: 32, w: 32),
                ),
              ),
              Center(child: assetImage(DefaultImages.abandonedTxtImage, h: 42)),
              verticalSpace(4),
              Center(child: assetImage(DefaultImages.begginerImage, h: 42)),
              verticalSpace(12),
              profileStreakWidget(profileImage: DefaultImages.profileImage, earned: '1,138', model: '4', streak: '15', accuracy: '80%'),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lifelineWidget(title: AppString.kLifeline.tr, image: DefaultImages.callIcn, total: AppString.k5050.tr),
                  horizontalSpace(12),
                  lifelineWidget(title: AppString.kAnswer.tr, image: DefaultImages.tickCircleIcon, total: '9/10'),
                ],
              ),
              verticalSpace(16),
              shareOnWidget(actionFacebook: () {}, actionInstagram: () {}, actionTelegram: () {}, actionTwitter: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
