import 'dart:ui';

import 'package:brain_bucks/core/controller/profile_controller.dart';
import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/view/screen/auth/login.dart';
import 'package:brain_bucks/view/screen/profile_screen/profile_screen.dart';
import 'package:brain_bucks/view/widgets/common_space_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameplayDialog extends StatelessWidget {
  GameplayDialog({super.key});

  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.all(AppDimen.padding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimen.radius)),
        content: Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: AppColors.kBackGround,
            borderRadius: BorderRadius.circular(AppDimen.smallRadius),
            image: DecorationImage(image: AssetImage(DefaultImages.dialogBgImage), fit: BoxFit.fill),
          ),
          padding: EdgeInsets.all(AppDimen.padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              authTitleRow(AppString.kGameplay.tr),
              verticalSpace(Get.height * 0.018), //16
              ListView.builder(
                shrinkWrap: true,
                itemCount: profileController.gameplayList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  var dict = profileController.gameplayList[index];
                  return taskWidget(
                    image: dict['image'],
                    title: dict['title'],
                    text: dict['count'],
                    isText: true,
                    space: 8,
                    actionOnTap: () {
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
