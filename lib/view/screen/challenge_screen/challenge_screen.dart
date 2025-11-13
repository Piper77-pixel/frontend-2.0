import 'package:brain_bucks/core/controller/challenges_controller.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/challenge_screen/challenge_widget.dart';
import 'package:brain_bucks/view/screen/home_screen/home_screen_widgets.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
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
          challengeAppBar(AppString.kChallenges.tr),
          Expanded(
            child: Obx(() {
              return ListView(
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
                          isEnable: dict.isEnable,
                          onTap: () {
                            dict!.isEnable = false;
                            challengesController.challenges.refresh();
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: SizeConfig.h(128),
                      // height: 128,
                      width: SizeConfig.screenWidth,
                      padding: EdgeInsets.fromLTRB(12, 4, 8, 0),
                      decoration: boxDecoration(
                        color: AppColors.kThemeColor,
                        radius: 12,
                        decorationImage: DecorationImage(image: AssetImage(DefaultImages.challengeExpireBgImage), fit: BoxFit.fill),
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
                                  ).createShader(Rect.fromLTWH(0, 150, 0, 200)),
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
              );
            }),
          ),
        ],
      ),
    );
  }
}
