import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget summerChallengeWidget({String? days, hour, minutes, second, totalCoin, totalSpark, bgImage, Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      height: Get.height * 0.157,
      //      height: 128,
      width: Get.width,
      padding: EdgeInsets.fromLTRB(12, 12, 16, 12),
      decoration: BoxDecoration(
        color: AppColors.kThemeColor,
        borderRadius: BorderRadiusGeometry.circular(12),
        image: DecorationImage(image: AssetImage(bgImage!), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  timeBox(time: days, title: AppString.kDAYS),
                  horizontalSpace(4),
                  timeBox(time: hour, title: AppString.kHOURS),
                  horizontalSpace(4),
                  timeBox(time: minutes, title: AppString.kMINUTES),
                  horizontalSpace(4),
                  timeBox(time: second, title: AppString.kSECONDS),
                ],
              ),
              Row(children: [shadowCoinWidget(totalCoin), horizontalSpace(8), shadowCoinWidget(totalSpark, isSpark: true)]),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 35,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(colors: AppColors.linerBtnColor, begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Center(
                child: Text(
                  AppString.kEnrolNow.tr,
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
            ),
          ),
        ],
      ),
    ),
  );
}

Widget shadowCoinWidget(String total, {bool isSpark = false}) {
  return Container(
    height: 24,
    // width: 60,
    decoration: BoxDecoration(
      // color: AppColors.kBlack.withOpacity(0.15),
      borderRadius: BorderRadius.circular(35),
      image: DecorationImage(image: AssetImage(isSpark ? DefaultImages.sparkBgImage : DefaultImages.coinBgImage), fit: BoxFit.fill),
    ),
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        assetImage(isSpark ? DefaultImages.sparkIcon : DefaultImages.coinIcon, w: 22, h: 22),
        Text(total, style: pNunitoExtraBold10.copyWith(fontSize: 10)),
      ],
    ),
  );
}

Widget timeBox({String? time, String? title}) {
  return Container(
    height: 36,
    width: 36,
    decoration: BoxDecoration(color: AppColors.kHex2D1037, borderRadius: BorderRadius.circular(4)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(time!, style: pNunitoExtraBold10.copyWith(fontSize: 12)),
        verticalSpace(2),
        Text(title!.tr, style: pRobotoRegular10.copyWith(fontSize: 6, color: AppColors.kHexC08CFF)),
      ],
    ),
  );
}

startDuelBtn({required String title, bool isSingle = false, Function()? onTap, String? image,String? bgImage}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Stack(
      alignment: AlignmentGeometry.centerLeft,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CommonThemeButton(height: 52, title: title, bgImage: bgImage ?? (isSingle ? DefaultImages.singleButtonImage : null), onPressed: onTap),
        ),
        assetImage(image ?? (isSingle ? DefaultImages.circleSingleImage : DefaultImages.circleDuelImage), h: 70, w: 70),
      ],
    ),
  );
}
