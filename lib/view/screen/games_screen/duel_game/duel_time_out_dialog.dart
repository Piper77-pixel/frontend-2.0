import 'dart:ui';

import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/dashboard_manager/dashboard_manager.dart';
import 'package:brain_bucks/view/screen/home_screen/home_profile_appbar.dart';
import 'package:brain_bucks/view/screen/home_screen/home_screen_widgets.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/custom_progressbar.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuelTimeOutDialog extends StatelessWidget {
  const DuelTimeOutDialog({super.key});

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
              Center(child: assetImage(DefaultImages.timeOutTxtImage, h: 42)),
              verticalSpace(4),
              Center(child: assetImage(DefaultImages.hardIcon, h: 42)),
              verticalSpace(SizeConfig.h(10)), //12
              Center(child: assetImage(DefaultImages.alarmIcon, h: SizeConfig.h(130))),
              profileStreakWidget(profileImage: DefaultImages.profileImage, earned: '1,138', model: '4', streak: '15', accuracy: '80%'),
              verticalSpace(SizeConfig.h(15)), //16
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lifelineWidget(title: AppString.kLifeline.tr, image: DefaultImages.fiftyIcn, total: AppString.k5050.tr),
                  horizontalSpace(12),
                  lifelineWidget(title: AppString.kAnswer.tr, image: DefaultImages.tickCircleIcon, total: '9/10'),
                ],
              ),
              verticalSpace(SizeConfig.h(15)), //16
              shareOnWidget(actionFacebook: () {}, actionInstagram: () {}, actionTelegram: () {}, actionTwitter: () {}),
              verticalSpace(12),
              CommonThemeButton(
                title: AppString.kHome.tr,
                icon: DefaultImages.homeIcon,
                onPressed: () {
                  Get.offAll(() => DashboardManager());
                },
                height: SizeConfig.h(51),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget lifelineWidget({String? title, String? image, String? total}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(title!, style: pRobotoRegular10.copyWith(fontSize: 12)),
      verticalSpace(2),
      assetImage(image!, h: SizeConfig.h(35), w: 36),
      verticalSpace(2),
      Text(total!, style: pNunitoBold10.copyWith(fontSize: SizeConfig.sp(16))),
    ],
  );
}

Widget profileStreakWidget({String? profileImage, earned, model, streak, accuracy, bool isShowIndicator = false, String? score, hScore, double? progressValue}) {
  return Padding(
    padding: EdgeInsets.only(top: isShowIndicator ? SizeConfig.h(38) : 45),
    child: SizedBox(
      // height: isShowIndicator ? Get.height * 0.15 : Get.height * 0.115,
      height: isShowIndicator ? SizeConfig.h(121) : SizeConfig.h(93),
      child: Stack(
        alignment: Alignment.topCenter - Alignment(0, isShowIndicator ? 1.3 : 2),
        children: [
          Container(
            height: isShowIndicator ? SizeConfig.h(121) : SizeConfig.h(93),
            decoration: boxDecoration(
              color: AppColors.kHex0F0214,
              radius: AppDimen.buttonRadius,
              boxShadow: [BoxShadow(color: AppColors.kWhite.withOpacity(0.1), blurRadius: 16, spreadRadius: 0)],
            ),
            padding: EdgeInsets.fromLTRB(SizeConfig.h(15), 0, SizeConfig.h(15), SizeConfig.h(15)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(AppString.kEarned.tr, style: pRobotoRegular10),
                        verticalSpace(SizeConfig.h(4)),
                        shadowCoinWidget(earned, font: SizeConfig.sp(11), icon: SizeConfig.h(24), height: SizeConfig.h(26)),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(AppString.kStreak.tr, style: pRobotoRegular10),
                        verticalSpace(SizeConfig.h(4)),
                        shadowStreakWidget(model, streak),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(AppString.kAccuracy.tr, style: pRobotoRegular10),

                        shadowCoinWidget(accuracy, font: SizeConfig.sp(11), icon: SizeConfig.h(24), height: SizeConfig.h(26), iconImage: DefaultImages.targetIcon),
                      ],
                    ),
                  ],
                ),
                isShowIndicator
                    ? Padding(
                        padding: EdgeInsets.only(top: SizeConfig.h(8)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${AppString.kYourScore.tr} $score', style: pRobotoMedium10.copyWith(fontSize: SizeConfig.h(11))),
                                Text(
                                  '${AppString.kHighest.tr} $hScore',
                                  style: pRobotoMedium10.copyWith(fontSize: SizeConfig.h(11), color: AppColors.kWhite.withOpacity(0.5)),
                                ),
                              ],
                            ),
                            verticalSpace(2),
                            ImageFillProgressBar(value: progressValue!, fillImage: AssetImage(DefaultImages.winProgressbarImage), height: SizeConfig.h(12)),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
          profileWidget(profileImage, Size(SizeConfig.w(64), SizeConfig.h(63)), padding: 0),
        ],
      ),
    ),
  );
}

Widget shadowStreakWidget(String total, streak) {
  return Container(
    height: SizeConfig.h(26),
    // width: 60,
    decoration: boxDecoration(
      // color: AppColors.kBlack.withOpacity(0.15),
      borderRadius: BorderRadius.circular(0.043),
      decorationImage: DecorationImage(image: AssetImage(DefaultImages.streakBgIcon), fit: BoxFit.fill),
    ),
    padding: EdgeInsets.fromLTRB(2, 5, 8, 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        assetImage(DefaultImages.medalGoldIcon, w: SizeConfig.w(24), h: SizeConfig.h(24)),
        Text(total, style: pNunitoExtraBold10.copyWith(fontSize: SizeConfig.h(11))),
        horizontalSpace(4),
        assetImage(DefaultImages.fireIcon, w: SizeConfig.w(24), h: SizeConfig.h(24)),
        Text(streak, style: pNunitoExtraBold10.copyWith(fontSize: SizeConfig.h(11))),
      ],
    ),
  );
}

shareOnWidget({Function()? actionFacebook, Function()? actionInstagram, Function()? actionTelegram, Function()? actionTwitter}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppString.kShareOn.tr, style: pRobotoMedium10.copyWith(fontSize: 16)),
        verticalSpace(SizeConfig.h(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: actionFacebook,
              child: assetImage(DefaultImages.facebookIcon, h: SizeConfig.h(51), w: SizeConfig.w(51)),
            ),
            GestureDetector(
              onTap: actionInstagram,
              child: assetImage(DefaultImages.instagramIcon, h: SizeConfig.h(51), w: SizeConfig.w(51)),
            ),
            GestureDetector(
              onTap: actionTelegram,
              child: assetImage(DefaultImages.telegramIcon, h: SizeConfig.h(51), w: SizeConfig.w(51)),
            ),
            GestureDetector(
              onTap: actionTwitter,
              child: assetImage(DefaultImages.twitterIcon, h: SizeConfig.h(51), w: SizeConfig.w(51)),
            ),
          ],
        ),
      ],
    ),
  );
}
