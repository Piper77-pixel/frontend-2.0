import 'dart:ui';

import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/screen/home_screen/home_screen_widgets.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YouWinDialog extends StatelessWidget {
  const YouWinDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),

      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.all(AppDimen.padding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimen.radius)),
        content: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: AppColors.kBackGround,
            borderRadius: BorderRadius.circular(AppDimen.smallRadius),
            image: DecorationImage(image: AssetImage(DefaultImages.winDialogBgImage), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.all(AppDimen.padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              verticalSpace(8),
              assetImage(DefaultImages.youWinTxtImage, h: 47),
              verticalSpace(8),
              assetImage(DefaultImages.threeStarImage, w: 275, h: 96),
              verticalSpace(32),
              Stack(
                alignment: Alignment.topCenter - Alignment(0, .6),
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppColors.kHex0A020E, borderRadius: BorderRadius.circular(AppDimen.buttonRadius)),
                    padding: EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        shadowCoinWidget('1,138', font: 11, icon: 24, height: 26),
                        shadowCoinWidget('1,138 EXP', font: 11, icon: 24, height: 26, bg: DefaultImages.expBgImage, isIcon: false),
                        shadowCoinWidget('2,138', font: 11, icon: 24, height: 26, isSpark: true),
                      ],
                    ),
                  ),
                  Text(AppString.kRewardsCapital, style: pNunitoExtraBold10.copyWith(fontSize: 18)),
                ],
              ),
              verticalSpace(24),
              CommonThemeButton(
                title: AppString.kCollect.tr,
                onPressed: () {
                  Get.offAll(() => DashboardManager());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
