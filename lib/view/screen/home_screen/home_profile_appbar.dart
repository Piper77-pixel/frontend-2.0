import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/prefer.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/auth/show_auth_dialog.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProfileAppbar extends StatelessWidget {
  final String coin;
  final String profileName;
  final String profileImage;
  const HomeProfileAppbar({super.key, required this.coin, required this.profileName, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter - Alignment(0, -0.5),
      children: [
        Container(
          // height: 150,
          height: Get.height * 0.18,
          width: Get.width,
          decoration: BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(image: AssetImage(DefaultImages.appbarBgImage), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.fromLTRB(32, 0, 30, Get.height * 0.03),
          child: SafeArea(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  coinWidget(coin),
                  (Prefs.getAccessToken() == '' || Prefs.getAccessToken().isEmpty)
                      ? signupWidget(() {
                          showLoginSignupDialog(context);
                        })
                      : GestureDetector(onTap: () {}, child: assetImage(DefaultImages.mainIcon, w: 28, h: 20)),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, Get.height * 0.025),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                profileWidget(profileImage),
                verticalSpace(10),
                Text(profileName, style: pRobotoMedium10.copyWith(fontSize: 11)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Container profileWidget(image) {
  return Container(
    width: 58,
    height: 58,
    decoration: BoxDecoration(color: AppColors.kHex602F7B, shape: BoxShape.circle),
    padding: EdgeInsets.all(2),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.kThemeColor,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.kThemeColor, width: 2),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget coinWidget(String title) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: AppColors.linerCoinColor, begin: AlignmentGeometry.topCenter, end: AlignmentGeometry.bottomCenter),
      borderRadius: BorderRadius.circular(40),
    ),
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
    child: Row(
      children: [
        assetImage(DefaultImages.coinIcon, w: 21, h: 20),
        horizontalSpace(2),
        Text(title, style: pNunitoExtraBold10.copyWith(fontSize: 11)),
      ],
    ),
  );
}

Widget signupWidget(Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: AppColors.linerCoinColor, begin: AlignmentGeometry.topCenter, end: AlignmentGeometry.bottomCenter),
        borderRadius: BorderRadius.circular(40),
      ),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: Text(AppString.kSignUp.tr, style: pNunitoExtraBold10.copyWith(fontSize: 11)),
    ),
  );
}
