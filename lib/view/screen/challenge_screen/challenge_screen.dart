import 'package:brain_bucks/core/controller/challenges_controller.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/home_screen/home_screen_widgets.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeScreen extends StatelessWidget {
  ChallengeScreen({super.key});

  ChallengesController challengesController = Get.put(ChallengesController());

  @override
  Widget build(BuildContext context) {
    return BgImageWidget(
      bgImage: DefaultImages.homeBgImage,
      child: Column(
        children: [
          challengeAppBar(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(16, 24, 16, 20),
              children: [
                ListView.builder(
                  itemCount: challengesController.challenges.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    Challenge dict = challengesController.challenges[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: summerChallengeWidget(
                        days: "${dict.days}",
                        hour: '${dict.hours}',
                        minutes: '${dict.minutes}',
                        second: '${dict.seconds}',
                        totalCoin: '${dict.coins}',
                        totalSpark: '${dict.energy}',
                        bgImage: dict.background,
                        onTap: () {},
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: Get.height * 0.157,
                    // height: 128,
                    width: Get.width,
                    padding: EdgeInsets.fromLTRB(12, 4, 8, 0),
                    decoration: BoxDecoration(
                      color: AppColors.kThemeColor,
                      borderRadius: BorderRadiusGeometry.circular(12),
                      image: DecorationImage(image: AssetImage(DefaultImages.challengeExpireBgImage), fit: BoxFit.fill),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            'End at : 2025/06/08',
                            style: pNunitoExtraBold10.copyWith(
                              fontSize: 16,
                              foreground: Paint()
                                ..shader = LinearGradient(
                                  colors: <Color>[AppColors.kFont, AppColors.kGreyBorder],
                                  begin: AlignmentGeometry.topCenter,
                                  end: AlignmentGeometry.bottomCenter,
                                ).createShader(Rect.fromLTWH(0, 25, 0, 200)),
                            ),
                          ),
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            stageUserWidget(
                              profileImage: DefaultImages.profileImage,
                              profileImage1: DefaultImages.profile1Image,
                              profileImage2: DefaultImages.profileImage,
                              name: 'Alena Donin',
                              name1: 'Davis Curtis',
                              name2: 'Craig Gouse',
                              total: '1,469',
                              total1: '2,569',
                              total2: '1,053',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget challengeAppBar() {
    return Container(
      height: Get.height * 0.145,
      width: Get.width,
      decoration: BoxDecoration(
        // color: Colors.red,
        image: DecorationImage(image: AssetImage(DefaultImages.appbarBgImage), fit: BoxFit.fill),
      ),
      padding: EdgeInsets.fromLTRB(32, 0, 30, Get.height * 0.03),
      child: SafeArea(
        child: Center(child: Text(AppString.kChallenges.tr, style: pNunitoBold10.copyWith(fontSize: 20))),
      ),
    );
  }
}

Widget stageUserWidget({String? profileImage, profileImage1, profileImage2, name, name1, name2, total, total1, total2,}) {
  return Stack(
    alignment: Alignment.bottomCenter,
    clipBehavior: Clip.none,
    children: [
      Container(child: assetImage(DefaultImages.challengeStageImage, w: 124)),
      Positioned(
        bottom: Get.height * 0.062, //-45,
        left: 2,
        child: buildTopThreeDataWidget(profileImage: profileImage, name: name, total: total,isShowCrown: false),
      ),
      Positioned(
        bottom: Get.height * 0.073, //-75,
        left: 50,
        child: buildTopThreeDataWidget(profileImage: profileImage1, name: name1, total: total1,isShowCrown: true),
      ),
      Positioned(
        bottom: Get.height * 0.045, //-75,
        right: 2,
        child: buildTopThreeDataWidget(profileImage: profileImage2, name: name2, total: total2,isShowCrown: false),
      ),
    ],
  );
}

buildTopThreeDataWidget({String? profileImage, String? name, String? total,bool?isShowCrown}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: Get.height * 0.025,
              width: Get.width * 0.055,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(image: NetworkImage(profileImage!), fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(top: 0, child: Visibility(visible: isShowCrown!,child: assetImage(DefaultImages.crownImage, h: 13, w: 22))),
        ],
      ),
      Text(name!, style: pRobotoMedium10.copyWith(fontSize: 6)),
      Container(
        height: 13,
        width: 28,
        decoration: BoxDecoration(color: AppColors.kHexAB1DFF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(total!, style: pRobotoMedium10.copyWith(color: AppColors.kFont, fontSize: 5)),
            horizontalSpace(1),
            assetImage(DefaultImages.coinIcon, h: 7, w: 7),
          ],
        ),
      ),
    ],
  );
}
