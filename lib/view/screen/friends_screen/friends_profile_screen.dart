import 'package:brain_bucks/core/controller/friends_list_controller.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/home_screen/home_profile_appbar.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/custom_progressbar.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../widgets/common_space_divider_widget.dart';
import '../home_screen/home_screen_widgets.dart';

class FriendsProfileScreen extends StatefulWidget {
  const FriendsProfileScreen({super.key});

  @override
  State<FriendsProfileScreen> createState() => _FriendsProfileScreenState();
}

class _FriendsProfileScreenState extends State<FriendsProfileScreen> {
  FriendsListController friendsListController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    friendsListController.isRequested.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: buildSystemUiOverlayStyle(),
      child: BgImageWidget(
        bgImage: DefaultImages.gameScreenBgImage,
        child: Obx(() {
          return Column(
            children: [
              FriendsProfileAppbar(coin: '1138', profileName: '@Xcaesar', profileImage: DefaultImages.profileImage, level: '30', spark: '2128'),
              ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(16, 32, 16, 20),
                children: [
                  buildRequestButton(
                    isRequested: friendsListController.isRequested.value,
                    onTap: () {
                      if (friendsListController.isRequested.value == false) {
                        friendsListController.isRequested.value = true;
                      } else {
                        Get.back();
                      }
                    },
                  ),
                  verticalSpace(46),
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
                  verticalSpace(32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: leftWinUserWidget(name: AppString.kWin.tr, level: "20", profileImage: DefaultImages.winFlagImage),
                        ),
                        horizontalSpace(16),
                        Expanded(
                          child: leftWinUserWidget(name: AppString.kLose.tr, level: "20", profileImage: DefaultImages.loseFlagImage, isRight: true),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget buildRequestButton({bool isRequested = false, Function()? onTap}) {
    return isRequested == true
        ? CommonButton(onPressed: onTap, title: AppString.kRequested.tr, height: 40, horizontal: 5, fontSize: 15)
        : CommonThemeButton(onPressed: onTap, title: AppString.kREQUEST.tr, icon: DefaultImages.addCircleIcon, height: 40, horizontal: 5, fontSize: 15);
  }

  Widget leftWinUserWidget({bool isRight = false, String? profileImage, name, level}) {
    return Stack(
      alignment: isRight ? Alignment.topRight - Alignment(-.3, 0) : Alignment.topLeft - Alignment(0.3, 0),
      children: [
        Container(
          height: 75,
          // width: 147,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(isRight ? DefaultImages.loseCountBgImage : DefaultImages.winCountBgImage), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.only(left: isRight ? 24 : 0, right: isRight ? 0 : 30),
          child: Align(
            alignment: isRight ? Alignment.topLeft : Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name, style: pRobotoMedium10.copyWith(fontSize: 20), textAlign: TextAlign.center),
                Card(
                  color: Colors.red,
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: isRight ? [AppColors.kHexE60F2F, AppColors.kHexAB0529] : [AppColors.kHex0FE673, AppColors.kHex05AB4A],
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        level,
                        style: pRobotoBold10.copyWith(fontSize: 14, color: AppColors.kFont),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        profileCircleWidget(isRight, profileImage),
      ],
    );
  }
}

Container profileCircleWidget(bool isRight, String? image) {
  return Container(
    width: 58,
    height: 58,
    decoration: BoxDecoration(
      color: AppColors.kHex111011,
      shape: BoxShape.circle,
      border: Border.all(color: isRight ? AppColors.kHexEB4435 : AppColors.kHex2CBD6D, width: 1),
    ),
    child: Center(child: assetImage(image!, h: 48)),
  );
}

class FriendsProfileAppbar extends StatelessWidget {
  final String coin;
  final String spark;
  final String profileName;
  final String profileImage;
  final String level;

  const FriendsProfileAppbar({super.key, required this.coin, required this.profileName, required this.profileImage, required this.level, required this.spark});

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
          padding: EdgeInsets.fromLTRB(16, 0, 16, Get.height * 0.08),
          child: SafeArea(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: assetImage(DefaultImages.backIcon, h: 24, w: 24),
                      ),
                      horizontalSpace(24),
                      shadowCoinWidget(spark, font: 11, icon: 24, height: 26, isSpark: true),
                    ],
                  ),
                  Row(children: [shadowCoinWidget(coin, font: 11, icon: 24, height: 26), horizontalSpace(16), assetImage(DefaultImages.settingIcon)]),
                ],
              ),
            ),
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
