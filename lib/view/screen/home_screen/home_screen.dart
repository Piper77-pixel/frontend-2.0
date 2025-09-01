import 'dart:ui';

import 'package:brain_bucks/core/controller/home_controller.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/icons.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/prefer.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/auth/show_auth_dialog.dart';
import 'package:brain_bucks/view/screen/home_screen/home_profile_appbar.dart';
import 'package:brain_bucks/view/screen/home_screen/home_screen_widgets.dart';
import 'package:brain_bucks/view/screen/home_screen/single_player_dialog.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return BgImageWidget(
      bgImage: DefaultImages.homeBgImage,
      child: Column(
        children: [
          HomeProfileAppbar(coin: "1138", profileName: 'Guest3467', profileImage: DefaultImages.profileImage),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(16, 24, 16, 20),
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    summerChallengeWidget(days: "360", hour: '24', minutes: '60', second: '60', totalCoin: '1,138', totalSpark: '2,128', bgImage: DefaultImages.summerChallengeImage, onTap: () {}),
                    Prefs.getAccessToken() == '' || Prefs.getAccessToken().isEmpty ? guestChallengeWidget(context) : SizedBox(),
                  ],
                ),
                verticalSpace(32),
                startDuelBtn(
                  title: AppString.kStartADuel.tr,
                  onTap: () {
                    if (Prefs.getAccessToken() == '' || Prefs.getAccessToken().isEmpty) {
                      showLoginSignupDialog(context);
                    } else {
                      showMessage("Duel Tap ⚜️");
                    }
                  },
                  bgImage: Prefs.getAccessToken() == '' || Prefs.getAccessToken().isEmpty ? DefaultImages.greyButtonImage : null,
                  image: Prefs.getAccessToken() == '' || Prefs.getAccessToken().isEmpty ? DefaultImages.lockIcon : null,
                ),
                verticalSpace(16),
                startDuelBtn(
                  title: AppString.kStartASingle.tr,
                  onTap: () {
                    showShinglePlayerDialog(context);
                  },
                  isSingle: true,
                ),
                verticalSpace(40),
                if (Prefs.getAccessToken() != '' || Prefs.getAccessToken().isNotEmpty)
                  ListView.builder(
                    itemCount: homeController.matches.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final match = homeController.matches[index];
                      return match.isAllWinner == true ? winnerBoxWidget(DefaultImages.profileImage) : gameHistoryWidget(match: match);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget guestChallengeWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showLoginSignupDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: Get.height * 0.157,
            width: Get.width,
            decoration: BoxDecoration(
              // color: AppColors.kOpacityBackGround,
              color: AppColors.kBlack.withOpacity(0.4),
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                height: Get.height * 0.157,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  border: Border.all(color: AppColors.kGreyBorder),
                ),
                child: Center(
                  child: CircleAvatar(backgroundColor: AppColors.kOpacityBackGround, radius: 35, child: assetImage(DefaultImages.lock3DIcon, h: 35)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget gameHistoryWidget({required MatchCardData match}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          image: match.isWinner ? DecorationImage(image: AssetImage(DefaultImages.homeWinConfettiImage)) : null,
          gradient: LinearGradient(colors: AppColors.linerGameColor, begin: AlignmentGeometry.topCenter, end: AlignmentGeometry.bottomCenter),
          borderRadius: BorderRadius.circular(16),
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: match.isWinner ? AppColors.linerGreenBorderColor : AppColors.linerRedBorderColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.0, 0.99, 0.0],
            ),
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Container(
              height: 50,
              // width: 120,
              // color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: leftWinUserWidget(isShowCrown: match.player1.hasCrown, profileImage: match.player1.avatar, name: match.player1.name, level: match.player1.level.toString()),
                  ),
                  Expanded(child: assetImage(DefaultImages.vsImage, h: 40, w: 40)),
                  Expanded(
                    child: leftWinUserWidget(isRight: true, isShowCrown: match.player2.hasCrown, profileImage: match.player2.avatar, name: match.player2.name, level: match.player2.level.toString()),
                  ),
                ],
              ),
            ),
            verticalSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: match.player1.results.map((e) => assetImage(e == 'win' ? DefaultImages.tickCircleIcon : DefaultImages.closeCircleIcon, h: 18, w: 18)).toList()),
                shadowCoinWidget(match.coins.toString()),
                Row(children: match.player2.results.map((e) => assetImage(e == 'win' ? DefaultImages.tickCircleIcon : DefaultImages.closeCircleIcon, h: 18, w: 18)).toList()),
                // Row(children: List.generate(5, (index) => assetImage(index == 0 || index == 2 ? DefaultImages.tickCircleIcon : DefaultImages.closeCircleIcon, w: 18, h: 18))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget winnerBoxWidget(String profileImage) {
    return SizedBox(
      height: 138,
      child: Stack(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(DefaultImages.winnerConfettimage)),
              gradient: LinearGradient(colors: AppColors.linerGameColor, begin: AlignmentGeometry.topCenter, end: AlignmentGeometry.bottomCenter),
              borderRadius: BorderRadius.circular(16),
              border: GradientBoxBorder(
                gradient: LinearGradient(colors: AppColors.linerGreenBorderColor, begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [0.0, 0.0, 0.99, 0.0]),
                width: 1,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [horizontalSpace(0), winnerProfileWidget(profileImage), horizontalSpace(0), assetImage(DefaultImages.trofyImage, h: 72)],
            ),
          ),
          Align(alignment: Alignment.topLeft - Alignment(.1, .7), child: assetImage(DefaultImages.winnerBannerImage, h: 90, w: 92)),
        ],
      ),
    );
  }

  Widget winnerProfileWidget(image) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(padding: const EdgeInsets.only(top: 18), child: profileCircleWidget(false, image, h: 70.0, w: 70.0)),
        Positioned(top: 0, child: assetImage(DefaultImages.crownImage, h: 27)),
      ],
    );
  }

  Widget leftWinUserWidget({bool isRight = false, isShowCrown, String? profileImage, name, level}) {
    return Stack(
      alignment: isRight ? Alignment.topRight - Alignment(-.6, 0) : Alignment.topLeft - Alignment(0.6, 0),
      children: [
        Container(
          height: 48,
          width: 120,
          decoration: BoxDecoration(
            // color: Colors.yellow,
            image: DecorationImage(image: AssetImage(isRight ? DefaultImages.homeRightImage : DefaultImages.homeLeftImage), fit: BoxFit.fill),
          ),
          // padding: EdgeInsets.only(left: isRight ? 16 : 10, right: isRight ? 0 : 16),
          padding: EdgeInsets.only(left: isRight ? 12 : 0, right: isRight ? 0 : 16),
          child: Column(
            crossAxisAlignment: isRight ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: pRobotoMedium10.copyWith(fontSize: 14), textAlign: TextAlign.center),
              Text(
                AppString.kLevel.tr + level,
                style: pRobotoMedium10.copyWith(fontSize: 10, color: AppColors.kLabel),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Stack(
          // alignment: isRight ? Alignment.topRight : Alignment.topLeft,
          alignment: isShowCrown
              ? isRight
                    ? Alignment.topRight
                    : Alignment.topLeft
              : isRight
              ? Alignment.topRight - Alignment(-.2, .2)
              : Alignment.topLeft - Alignment(.2, .2),

          children: [
            profileCircleWidget(isRight, profileImage),
            Align(
              alignment: isRight ? Alignment.topRight - Alignment(-.4, 2) : Alignment.topLeft - Alignment(.43, 2.9),
              child: isShowCrown
                  ? assetImage(
                      isRight ? DefaultImages.rightCrownImage : DefaultImages.leftCrownImage, // your crown image
                      w: 40,
                    )
                  : null,
            ),
          ],
        ),
      ],
    );
  }

  Container profileCircleWidget(bool isRight, String? profileImage, {double? h, w}) {
    return Container(
      width: w ?? 40,
      height: h ?? 40,
      decoration: BoxDecoration(
        color: AppColors.kThemeColor,
        shape: BoxShape.circle,
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: isRight ? AppColors.linerOrangeColor : AppColors.linerTealColor, stops: [0.07, 0.5, .93]),
          width: 1.76,
        ),
        image: DecorationImage(image: NetworkImage(profileImage!), fit: BoxFit.cover),
      ),
    );
  }
}
