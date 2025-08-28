import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/utils/prefer.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:brain_bucks/view/screen/auth/show_auth_dialog.dart';
import 'package:brain_bucks/view/screen/auth/sign_up.dart';
import 'package:brain_bucks/view/screen/home_screen/home_profile_appbar.dart';
import 'package:brain_bucks/view/widgets/bg_image_widget.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgImageWidget(
      bgImage: DefaultImages.homeBgImage,
      child: Column(
        children: [
         HomeProfileAppbar(coin: "1138", profileName: 'Guest3467', profileImage: DefaultImages.profileImage,),

          // Stack(
          //   alignment: Alignment.bottomCenter - Alignment(0, -3.6),
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(bottom: 2.5),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
          //         gradient: LinearGradient(colors: AppColors.linerAppBarBorderColor, begin: AlignmentGeometry.topCenter, end: AlignmentGeometry.bottomCenter),
          //       ),
          //       child: Container(
          //         width: Get.width,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
          //           gradient: LinearGradient(colors: AppColors.linerAppBarColor, begin: AlignmentGeometry.topCenter, end: AlignmentGeometry.bottomCenter),
          //         ),
          //         padding: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          //
          //         child: SafeArea(
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 decoration: BoxDecoration(
          //                   gradient: LinearGradient(colors: AppColors.linerCoinColor, begin: AlignmentGeometry.topCenter, end: AlignmentGeometry.bottomCenter),
          //                   borderRadius: BorderRadius.circular(40),
          //                 ),
          //                 padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          //                 child: Row(
          //                   children: [
          //                     assetImage(DefaultImages.coinIcon, w: 21, h: 20),
          //                     horizontalSpace(2),
          //                     Text("1138", style: pNunitoExtraBold10.copyWith(fontSize: 11)),
          //                   ],
          //                 ),
          //               ),
          //               assetImage(DefaultImages.mainIcon, w: 28, h: 20),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //     Stack(
          //       alignment: Alignment.bottomCenter,
          //       children: [
          //         // assetImage(DefaultImages.appbarProfileBg),
          //         Container(
          //           height: 64,
          //           width: 84,
          //           decoration: BoxDecoration(
          //               image: DecorationImage(image: AssetImage(DefaultImages.appbarProfileBg))),
          //
          //           // child: Center(child: Text("Guest3467", style: pRobotoMedium10.copyWith(fontSize: 11))),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Container(
          //                 width: 60,
          //                 height: 60,
          //                 decoration: BoxDecoration(color: AppColors.kHex602F7B, shape: BoxShape.circle),
          //                 padding: EdgeInsets.all(2),
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                     color: AppColors.kThemeColor,
          //                     shape: BoxShape.circle,
          //                     border: Border.all(color: AppColors.kThemeColor, width: 2),
          //                     image: DecorationImage(
          //                       image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW15BUXwvNHIpWR-nwmxAaGFIMCqM8AycwRolhIw8NsR0iU63l19H3EQxkudHEyrnZ4vY&usqp=CAU'),
          //                       fit: BoxFit.cover,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               verticalSpace(8),
          //               Text("Guest3467", style: pRobotoMedium10.copyWith(fontSize: 11)),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          verticalSpace(100),
          Container(height: 64, width: 84, decoration: BoxDecoration()),
        ],
      ),
    );
  }

}
