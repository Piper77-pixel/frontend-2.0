import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget challengeAppBar(String title) {
  return Container(
    height: Get.height * 0.145,
    width: Get.width,
    decoration: BoxDecoration(
      // color: Colors.red,
      image: DecorationImage(image: AssetImage(DefaultImages.appbarBgImage), fit: BoxFit.fill),
    ),
    padding: EdgeInsets.fromLTRB(32, 0, 30, Get.height * 0.03),
    child: SafeArea(
      child: Center(child: Text(title, style: pNunitoBold10.copyWith(fontSize: 20))),
    ),
  );
}

Widget stageUserWidget({String? profileImage, profileImage1, profileImage2, name, name1, name2, total, total1, total2}) {
  return Stack(
    alignment: Alignment.bottomCenter,
    clipBehavior: Clip.none,
    children: [
      Container(child: assetImage(DefaultImages.challengeStageImage, w: 124)),
      Positioned(
        bottom: Get.height * 0.062, //-45,
        left: 2,
        child: buildTopThreeDataWidget(profileImage: profileImage, name: name, total: total, isShowCrown: false),
      ),
      Positioned(
        bottom: Get.height * 0.073, //-75,
        left: 50,
        child: buildTopThreeDataWidget(profileImage: profileImage1, name: name1, total: total1, isShowCrown: true),
      ),
      Positioned(
        bottom: Get.height * 0.045, //-75,
        right: 2,
        child: buildTopThreeDataWidget(profileImage: profileImage2, name: name2, total: total2, isShowCrown: false),
      ),
    ],
  );
}

buildTopThreeDataWidget({String? profileImage, String? name, String? total, bool? isShowCrown}) {
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
          Positioned(
            top: 0,
            child: Visibility(visible: isShowCrown!, child: assetImage(DefaultImages.crownImage, h: 13, w: 22)),
          ),
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
