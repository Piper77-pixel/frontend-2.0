import 'dart:ui';

import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/screen/games_screen/games_screen.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YouLoseDialog extends StatelessWidget {
  final Function()? actionPlayAgain;

  const YouLoseDialog({super.key, required this.actionPlayAgain});

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
            image: DecorationImage(image: AssetImage(DefaultImages.dialogBgImage), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.all(AppDimen.padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.offAll(DashboardManager());
                  },
                  child: assetImage(DefaultImages.closeIcon, h: 32, w: 32),
                ),
              ),
              verticalSpace(8),
              assetImage(DefaultImages.youLoseTxtImage, h: 47),
              verticalSpace(8),
              assetImage(DefaultImages.emptyStarImage, w: 275, h: 96),
              verticalSpace(16),
              Row(
                children: [
                  Expanded(
                    child: CommonThemeButton(
                      onPressed: () {
                        Get.offAll(() => DashboardManager());
                      },
                      title: AppString.kHome.tr.toUpperCase(),
                      icon: DefaultImages.homeIcon,
                      bgImage: DefaultImages.redButtonBgImage,
                      height: 40,
                      fontSize: 15,
                      horizontal: 5,
                      icnSize: 20,
                    ),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: CommonThemeButton(
                      onPressed: actionPlayAgain,
                      horizontal: 5,
                      title: AppString.kPlayAgain.tr,
                      icon: DefaultImages.refreshCircleIcon,
                      height: 40,
                      fontSize: 15,
                      icnSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
