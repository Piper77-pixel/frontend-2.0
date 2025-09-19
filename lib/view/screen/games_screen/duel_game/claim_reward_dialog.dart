import 'dart:ui';

import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/constant.dart';
import 'package:brain_bucks/utils/images.dart';
import 'package:brain_bucks/view/widgets/common_button.dart';
import 'package:brain_bucks/view/widgets/icon_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClaimRewardDialog extends StatelessWidget {
  final Function() actionClaim;
  const ClaimRewardDialog({super.key, required this.actionClaim});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),

      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.all(AppDimen.padding),
        backgroundColor: AppColors.kTransparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimen.radius)),
        content: Column(
          children: [
            assetImage(DefaultImages.collectImage),
            CommonThemeButton(
              title: AppString.kClaimReward.tr,
              onPressed: actionClaim,
              width: 230,
            )
          ],
        )
      ),
    );
  }
}
