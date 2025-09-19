import 'package:brain_bucks/core/controller/game_controller/quiz_controller.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/games_screen/games_screen.dart';
import 'package:brain_bucks/view/screen/home_screen/home_profile_appbar.dart';
import 'package:brain_bucks/view/screen/home_screen/home_screen_widgets.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuelVsScreen extends StatefulWidget {
  const DuelVsScreen({super.key});

  @override
  State<DuelVsScreen> createState() => _DuelVsScreenState();
}

class _DuelVsScreenState extends State<DuelVsScreen> with TickerProviderStateMixin {
  QuizController quizController = Get.put(QuizController());

  AnimationController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quizController.isShowDuelVs.value = false;
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2), animationBehavior: AnimationBehavior.preserve);
    controller!.forward();
    Future.delayed(Duration(seconds: 2), () {
      quizController.isShowDuelVs.value = true;
      controller!.dispose();
      Future.delayed(Duration(seconds: 2), () {
        Get.off(() => GamesScreen(type: AppString.kDuel));
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: buildSystemUiOverlayStyle(),
      child: Scaffold(
        backgroundColor: AppColors.kBackGround,
        body: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              appBarWidget('2218', '1128'),
              quizController.isShowDuelVs.value
                  ? Expanded(
                      child: duelVsViewWidget(profileImage1: DefaultImages.profileImage, level1: '30', profileImage2: DefaultImages.profile1Image, level2: '32', friendName: '@parisOG'),
                    )
                  : Expanded(
                      child: SpinKitPouringHourGlassRefined(color: AppColors.kHexAB1DFF, size: 80.0, controller: controller, duration: Duration(seconds: 2)),
                    ),
            ],
          );
        }),
      ),
    );
  }

  Widget appBarWidget(String coin, String spark) {
    return Container(
      height: Get.height * 0.123,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(DefaultImages.duelVsAppbarImage), fit: BoxFit.fill)),
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [shadowCoinWidget(spark, font: 11, icon: 24, height: 26, isSpark: true), shadowCoinWidget(coin, font: 11, icon: 24, height: 26)],
          ),
        ),
      ),
    );
  }
}

Widget duelVsViewWidget({String? profileImage1, level1, String? profileImage2, level2, friendName}) {
  return Padding(
    padding: EdgeInsets.only(top: Get.height*0.064),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Container(
            // height: Get.height * 0.23,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              image: DecorationImage(image: AssetImage(DefaultImages.myProfileBgImage), fit: BoxFit.fill),
            ),
            padding: EdgeInsets.symmetric(vertical: Get.height*0.02),
            child: Column(
              children: [
                profileWidget(profileImage1, Size(Get.width * 0.25, Get.height * 0.116), padding: 0), //95
                verticalSpace(9),
                Text(AppString.kYou.tr, style: pRobotoMedium10.copyWith(fontSize: 22)),
                Text('${AppString.kLevel.tr} $level1', style: pRobotoMedium10.copyWith(fontSize: 15, color: AppColors.kWhite.withOpacity(0.4))),
              ],
            ),
          ),
        ),
        assetImage(DefaultImages.circleVsImage,h: Get.height*0.12,w: Get.width),
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: Container(
            // height: Get.height * 0.23,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              image: DecorationImage(image: AssetImage(DefaultImages.friendProfileBgImage), fit: BoxFit.fill),
            ),
            padding: EdgeInsets.symmetric(vertical: Get.height*0.02),
            child: Column(
              children: [
                profileWidget(profileImage2, Size(Get.width * 0.25, Get.height * 0.116), color: AppColors.kHex2A5510, padding: 0), //95
                verticalSpace(9),
                Text(friendName!, style: pRobotoMedium10.copyWith(fontSize: 22)),
                Text('${AppString.kLevel.tr} $level2', style: pRobotoMedium10.copyWith(fontSize: 15, color: AppColors.kWhite.withOpacity(0.4))),
              ],
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.fromLTRB(16,0 /*Get.height*0.057*/, 16, Get.height*0.045),
          child: CommonThemeButton(
            title: AppString.kCancel.tr,
            isBlack: true,
            onPressed: () {
              Get.back();
            },
            height: 40,
          ),
        ),
      ],
    ),
  );
}
