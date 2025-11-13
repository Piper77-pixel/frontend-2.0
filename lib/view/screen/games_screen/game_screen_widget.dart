import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/games_screen/circular_count_down.dart';
import 'package:brain_bucks/view/screen/home_screen/home_profile_appbar.dart';
import 'package:brain_bucks/view/screen/home_screen/home_screen_widgets.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameProfileAppbar extends StatelessWidget {
  final int timer;
  final String coin;
  final String spark;
   GameProfileAppbar({super.key, required this.coin, required this.spark, required this.timer});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center - Alignment(0, -0.5),
      children: [
        Container(
          // height: 150,
          // height: Get.height * 0.18,
          height: SizeConfig.h(146),
          width: SizeConfig.screenWidth,
          decoration: boxDecoration(
            radius: 0,
            decorationImage: DecorationImage(image: AssetImage(DefaultImages.appbarBgImage), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.fromLTRB(16, 0, 30, SizeConfig.h(0)),
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
                          child: assetImage(DefaultImages.backIcon,h: 24,w: 24)),
                      horizontalSpace(24),
                      shadowCoinWidget(spark,font: 11,icon: 24,height:26,isSpark: true,),
                    ],
                  ),
                  Row(
                    children: [
                      shadowCoinWidget(coin,font: 11,icon: 24,height:26),
                      horizontalSpace(24),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
        CircularCountdown(totalSeconds: timer,),
      ],
    );
  }
}
