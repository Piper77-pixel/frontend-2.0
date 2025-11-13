import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/size_config.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Onboarding1 extends StatelessWidget {
  dynamic data;

  Onboarding1({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Expanded(
            child: assetImage(DefaultImages.p1CoinImage, fit: BoxFit.cover, h: SizeConfig.h(390)),
          ),
          verticalSpace(SizeConfig.h(75)),
          assetImage(data["image"]),
          verticalSpace(4),
          Text(data["title"], style: pRobotoRegular10.copyWith(fontSize: 18), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class Onboarding2 extends StatelessWidget {
  dynamic data;

  Onboarding2({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 32), child: assetImage(data["image"], w: 270)),
        verticalSpace(4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),

          child: Text(data["title"], style: pRobotoRegular10.copyWith(fontSize: 18), textAlign: TextAlign.center),
        ),
        Expanded(
          child: assetImage(DefaultImages.p2BulbImage, fit: BoxFit.fitWidth, /* h: Get.height * 0.48,*/ w: SizeConfig.screenWidth),
        ),
      ],
    );
  }
}

class Onboarding3 extends StatelessWidget {
  dynamic data;

  Onboarding3({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: assetImage(DefaultImages.p3WinnerTrophyImage, fit: BoxFit.fitWidth, h:SizeConfig.h(390), w: SizeConfig.screenWidth),
        ),
        verticalSpace(SizeConfig.h(75)),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 32), child: assetImage(data["image"], w: 281)),
        verticalSpace(4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(data["title"], style: pRobotoRegular10.copyWith(fontSize: 18), textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
