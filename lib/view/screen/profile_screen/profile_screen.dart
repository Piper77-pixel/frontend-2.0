import 'package:brain_bucks/core/controller/profile_controller.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/icons.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/friends_screen/friends_profile_screen.dart';
import 'package:brain_bucks/view/screen/home_screen/home_profile_appbar.dart';
import 'package:brain_bucks/view/screen/profile_screen/achievements_dialog.dart';
import 'package:brain_bucks/view/screen/profile_screen/challenges_dialog.dart';
import 'package:brain_bucks/view/screen/profile_screen/gameplay_dialog.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/custom_progressbar.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return BgImageWidget(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: taskWidget(image: DefaultImages.logoutIcon, title: AppString.kLogOut.tr, actionOnTap: () {}, isIcon: true),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      child: Column(
        children: [
          ProfileAppbar(profileName: '@Xcaesar', profileImage: DefaultImages.profileImage, level: '30', actionSetting: () {}),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(16, Get.height*0.026, 16, 20),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('3800 EXP', style: pRobotoMedium10.copyWith(fontSize: 13)),
                      Text('5000 EXP', style: pRobotoMedium10.copyWith(fontSize: 13, color: AppColors.kWhite.withOpacity(0.6))),
                    ],
                  ),
                ),
                verticalSpace(4),
                ImageFillProgressBar(
                  value: 0.65,
                  fillImage: AssetImage(DefaultImages.themeButtonImage),
                  height: 30,
                  color: AppColors.kHex2A192F,
                  radius: BorderRadius.only(topLeft: Radius.elliptical(10, 20), topRight: Radius.elliptical(15, 40)),
                  imageRadius: BorderRadius.only(topLeft: Radius.elliptical(10, 20), topRight: Radius.elliptical(15, 40)),
                ),
                verticalSpace(Get.height * 0.036), //32
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: leftWinUserWidget(name: AppString.kWin.tr, level: "32", profileImage: DefaultImages.winFlagImage),
                      ),
                      horizontalSpace(16),
                      Expanded(
                        child: leftWinUserWidget(name: AppString.kLose.tr, level: "12", profileImage: DefaultImages.loseFlagImage, isRight: true),
                      ),
                    ],
                  ),
                ),
                verticalSpace(Get.height * 0.018), //16
                taskWidget(image: DefaultImages.taskIcon, title: AppString.kTasks.tr, actionOnTap: () {}),
                taskWidget(
                  image: DefaultImages.gameplayIcon,
                  title: AppString.kGameplay.tr,
                  actionOnTap: () {
                    handleADialog(context, GameplayDialog());
                  },
                ),
                taskWidget(
                  image: DefaultImages.achivementIcon,
                  title: AppString.kAchievements.tr,
                  actionOnTap: () {
                    handleADialog(context, AchievementsDialog());
                  },
                ),
                taskWidget(
                  image: DefaultImages.challengeIcon,
                  title: AppString.kChallenges.tr,
                  actionOnTap: () {
                    handleADialog(context, ChallengesDialog());
                  },
                ),
                verticalSpace(54),
              ],
            ),
          ),
        ],
      ),
    );
  }

  handleADialog(BuildContext context, Widget screen) async {
    showDialog(
      barrierDismissible: false,
      // barrierColor: AppColors.kOpacityBackGround,
      context: context,
      builder: (context) {
        return screen;
      },
    );
  }
}
  Widget taskWidget({String? image, title,double?space, bool isIcon = false, Function()? actionOnTap, bool isText = false, String? text}) {
    return Padding(
      padding:  EdgeInsets.only(bottom: Get.height*0.014),
      child: GestureDetector(
        onTap: actionOnTap,
        child: Container(
          height: Get.height * 0.062,
          //54
          width: Get.width,
          decoration: BoxDecoration(color: AppColors.kHex161616, borderRadius: BorderRadius.circular(AppDimen.buttonRadius)),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: Get.height * 0.045,
                    width: Get.width * 0.098,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(DefaultImages.taskIconBgIcon))),
                    child: Align(child: assetImage(image!, h: 30)),
                  ),
                  horizontalSpace(space??2),
                  Text(title!, style: pNunitoExtraBold10.copyWith(fontSize: 18)),
                ],
              ),
              isText ? Text(text!, style: pNunitoBold10.copyWith(fontSize: 16)) : assetImage(isIcon ? DefaultImages.arrowRightIcon : DefaultImages.arrowNextIcon, h: 20, w: 32),
            ],
          ),
        ),
      ),
    );
  }


class ProfileAppbar extends StatelessWidget {
  final String profileName;
  final String profileImage;
  final String level;
  final Function() actionSetting;

  const ProfileAppbar({super.key, required this.profileName, required this.profileImage, required this.level, required this.actionSetting});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center - Alignment(0, -0.5),
      children: [
        Container(
          height: Get.height * 0.23,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(DefaultImages.friendsAppbarImage), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.fromLTRB(16, 0, 16, Get.height * 0.12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [GestureDetector(onTap: actionSetting, child: assetImage(DefaultImages.settingIcon, h: 27))],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, Get.height * 0.00),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              profileWidget(profileImage, Size(Get.width * 0.25, Get.height * 0.116)), //95
              verticalSpace(4),
              Text(profileName, style: pRobotoMedium10.copyWith(fontSize: Get.width * 0.05)), //20
              verticalSpace(4),
              Text('${AppString.kLevel.tr} $level', style: pRobotoMedium10.copyWith(fontSize: 14, color: AppColors.kWhite.withOpacity(0.4))),
            ],
          ),
        ),
      ],
    );
  }
}
